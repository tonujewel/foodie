part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
class LoginValidationErrorState extends LoginState {
  final String error;

  LoginValidationErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
