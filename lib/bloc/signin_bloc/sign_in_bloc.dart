import 'package:bloc/bloc.dart';
import 'package:meher_kitchen/models/signin_with_google_model.dart';
import 'package:meta/meta.dart';

import '../../constants/client_id.dart';
import '../../models/signIn_user_model.dart';
import '../../utils/api_service/api_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    final apiService = ApiService();
    on<SignInInitialEvent>((event, emit) {
      emit.call(SignInInitialState());
    });
    on<SignInSuccessfullyEvent>((event, emit) async {
      try {
        Map<String, dynamic> data = await apiService.signInUser(event.model);
        print(data);
        if (data['Status'] == 'Invalid UserName/Password') {
          emit.call(
              SignInFailedState(message: 'InValid User Name or Password'));
        } else if (data['Status'] == 'Login Successfully') {
          emit.call(SignInSuccessfullyState());
        }
      } catch (e) {
        emit.call(
          SignInFailedState(
            message: e.toString(),
          ),
        );
      }
    });
    on<SignInWithGoogleEvent>((event, emit) async {
      try {
        Map<String, dynamic> data = await apiService
            .signInWithGoogleThroughApiService(event.signInWithGoogleModel);

        if (data['Status'] == 'Login Successfully') {
          ClientId.clientId = data['Id'];
          emit.call(SignInWithGoogleSuccessfullyState());
        } else {
          SignInFailedState(message: 'Sorry');
        }
      } catch (e) {
        emit.call(SignInWithGoogleFailedState(message: e.toString()));
      }
    });
  }
}
