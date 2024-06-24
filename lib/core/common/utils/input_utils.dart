

import 'package:caed_technical_challenge/core/preferences/app_ui_texts.dart';
import 'package:flutter/material.dart';

String? emailIsValid(String email) {
  final regex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final isValid = RegExp(regex).hasMatch(email);
  
  return email.isEmpty
      ?  UITexts.emptyInputError
      : !isValid
          ? UITexts.emailInputError
          : null;
}

String? passwordIsValid(String? password) =>
    password == null || password.isEmpty
        ? UITexts.emptyInputError
        : (password.length < 8)
            ? UITexts.passwordLengthInputError
            : null;

void unfocusNode(BuildContext _) {
  if (!FocusScope.of(_).hasPrimaryFocus) FocusScope.of(_).unfocus();
}
