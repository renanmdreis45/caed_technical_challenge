import 'package:caed_technical_challenge/core/common/utils/input_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final String hasError = "has_error";
  final String emailError = "email_error";
  final String passwordError = "passwordError";

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      final error = _validateFields(event);

      if (error[hasError]) {
        emit(LoginState(
          hasError: true,
          emailError: error[emailError],
          passwordError: error[passwordError],
        ));
        return;
      }

      emit(LoginState(
        logged: true,
      ));
    });
  }

  Map<String, dynamic> _validateFields(LoginEvent event) {
    var map = Map<String, dynamic>();
    map[hasError] = true;

    final emailValidate = emailIsValid(event.email!);

    if (emailValidate != null) {
      map[emailError] = emailValidate;
      return map;
    }

    final pwdValidate = passwordIsValid(event.password);

    if (pwdValidate != null) {
      map[passwordError] = pwdValidate;
      return map;
    }

    map[hasError] = false;

    return map;
  }
}
