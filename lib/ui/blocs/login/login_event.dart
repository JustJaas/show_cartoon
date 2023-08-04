part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends LoginEvent {
  final String? user;
  final String? password;
  const GetUser({this.user, this.password});
}

class GetPassword extends LoginEvent {
  final String? password;
  const GetPassword({this.password});
}

class SingIn extends LoginEvent {
  const SingIn();
}

class LogOut extends LoginEvent {
  const LogOut();
}

class ChangeError extends LoginEvent {
  const ChangeError();
}
