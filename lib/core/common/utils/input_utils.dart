

String? emailIsValid(String email) {
  final regex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final isValid = RegExp(regex).hasMatch(email);

  return email.isEmpty
      ?  .emptyInputError
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
