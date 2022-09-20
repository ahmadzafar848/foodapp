import 'package:bloc/bloc.dart';
import 'package:meher_kitchen/models/signup_user_model.dart';
import 'package:meta/meta.dart';

import '../../constants/client_id.dart';
import '../../utils/api_service/api_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ApiService apiService = ApiService();
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpInitialEvent>((event, emit) {
      emit.call(SignUpInitialState());
    });
    on<SignUpSuccessfullyEvent>((event, emit) async {
      try {
        Map<String, dynamic> data = await apiService.checkEmail(event.model);
        if (data['Status'] == 'Already Exists') {
          emit.call(SignUpFailedState(message: "Email Already Exist"));
        } else {
          Map<String, dynamic> data = await apiService.signUpUser(event.model);
          if (data['Status'] == 'Client Inserted Successfully') {
            int clientId = data['Id'];
            ClientId.clientId = clientId;
            emit.call(SignUpSuccessfullyState(id: clientId));
          } else {
            emit.call(SignUpInitialState());
          }
        }
      } catch (e) {
        emit.call(SignUpFailedState(message: e.toString()));
      }
    });
  }
}
