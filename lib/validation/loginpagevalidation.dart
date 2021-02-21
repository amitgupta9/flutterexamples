class LoginValidation {
  String emailvalidation(String value) {
    if (value.length < 3) {
      return 'Username must be greater than 3';
    }
    return null;
  }

  String passwordvalidation(String value) {
    if (value.length < 6) {
      return 'Password must be greater than 6';
    }
    return null;
  }
}
