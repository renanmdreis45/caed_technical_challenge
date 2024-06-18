part of 'login_bloc.dart';

abstract class UserLoginEvent extends Equatable {
  const UserLoginEvent();
}

class LoginEvent extends UserLoginEvent {
  final String? email;
  final String? password;

  LoginEvent({this.email, this.password});

  @override
  List<Object?> get props => [this.email, this.password];
}
