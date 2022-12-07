import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/data/repository/login_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/model/error_dm.dart';
import '../../../data/model/user_dm.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  LoginBloc(this._repository) : super(LoginInitial()) {
    on<RegisterServiceEvents>((event, emit) {
      // TODO: implement event handler
    });

    on<DoLoginEvent>((event, emit) async {
      print("object");
      String validation = checkValidation(event.email, event.password);

      if (validation == "valid") {
        emit(LoginLoadingState());

        try {
          (await _repository.loginApiCall(event.email, event.password)).fold(
              (ErrorDm errorDm) {
            //error
          
            emit(LoginErrorState("${errorDm.message}"));
          }, (UserDm userDm) {
            // success
            
            emit(LoginSuccessState());
          });
        } catch (e) {
      
          emit(LoginErrorState(e.toString()));
        }
      } else {
        emit(LoginValidationErrorState(validation));
      }
    });
  }

  String checkValidation(String email, String password) {
    String msg = "valid";

    if (email.isEmpty) {
      return "Email required";
    }

    if (password.isEmpty) {
      return "Password required";
    }

    print(msg);

    return msg;
  }
}
