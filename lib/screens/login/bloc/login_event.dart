part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class DoLoginEvent extends LoginEvent {
  final String email, password;

  const DoLoginEvent(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}

class RegisterServiceEvents extends LoginEvent {
  @override
  List<Object?> get props => [];
}
