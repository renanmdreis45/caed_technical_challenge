part of 'login_bloc.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class LoginInitial extends UserLoginState {
  @override
  List<Object> get props => [];
}

class LoginState extends UserLoginState {
  final bool logged;
  final bool hasError;
  final String? emailError;
  final String? passwordError;
  final dynamic user;

  LoginState({
    this.logged = false,
    this.hasError = false,
    this.emailError,
    this.passwordError,
    this.user,
  });

  @override
  List<Object> get props => [];
}

class LoginLoadingState extends UserLoginState {
  @override
  List<Object> get props => [];
}
class LoginErrorState extends UserLoginState {
  @override
  List<Object> get props => [];
}
