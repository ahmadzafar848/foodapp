import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meher_kitchen/utils/api_service/api_service.dart';
import 'package:meher_kitchen/utils/local_database/product_db_provider.dart';
import 'package:meta/meta.dart';

import '../../models/confirm_order_model.dart';

part 'confirm_order_event.dart';
part 'confirm_order_state.dart';

class ConfirmOrderBloc extends Bloc<ConfirmOrderEvent, ConfirmOrderState> {
  ApiService apiService = ApiService();
  ProductDbProvider productDbProvider = ProductDbProvider();
  ConfirmOrderBloc() : super(ConfirmOrderInitialState()) {
    on<ConfirmOrderSuccessfullyEvent>((event, emit) async {
      try {
        ConfirmOrderModel model = event.model;
        Map<String, dynamic> data = await apiService.confirmOrder(model);
        if (data['Status'] == 'Order Inserted Successfully') {
          emit.call(ConfirmOrderSuccessfullyState(
              message: 'Your Order Has been placed Successfully'));
          try {
            bool result = await productDbProvider.deleteAllProducts();
            if (result) {
              print('deleted all data in database');
            } else {
              print('can not delete data from database');
            }
          } catch (e) {
            print('Exception in deletion from confirm order');
          }
          emit.call(ConfirmOrderSuccessfullyState(
              message: 'Your Order Has been placed Successfully'));
        } else if (data['Status'] == 'Order Insertion Failed') {
          emit.call(ConfirmOrderFailedState(
              message: 'Sorry we can not place your Order'));
        } else {
          emit.call(ConfirmOrderFailedState(
              message: 'else bloc of confirm Order bloc'));
        }
      } catch (e) {
        emit.call(ConfirmOrderFailedState(message: e.toString()));
      }
    });
    on<GetCurrentLocationOfUserSuccessfullyEvent>((event, emit) async {
      String? name;
      String? area;
      String? country;
      String? street;
      String? completeAddress;
      try {
        Position position = await apiService.getUserCurrentLocation();
        double longitude = position.longitude;
        double latitude = position.latitude;
        List<Placemark> placeMarks =
            await placemarkFromCoordinates(latitude, longitude);
        for (int i = 0; i < placeMarks.length; i++) {
          name = placeMarks[i].name;
          area = placeMarks[i].administrativeArea;
          street = placeMarks[i].subThoroughfare;
          country = placeMarks[i].country;
        }
        completeAddress = '$name $street $area $country';
        emit.call(GetCurrentLocationOfUserSuccessfullyState(
            address: completeAddress));
      } catch (e) {
        print('sorry location');
      }
    });
  }
}
