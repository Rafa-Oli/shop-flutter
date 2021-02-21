class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": "Email exists",
    "OPERATION_NOT_ALLOWED": "Operation not allowed",
    "TOO_MANY_ATTEMPTS_TRY_LATER": " Too many attempts try later",
    "EMAIL_NOT_FOUND": "Email not found",
    "INVALID_PASSWORD": "Invalid Password",
    "USER_DISABLED": "User disabled",
  };

  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return "An authentication error has occurred";
    }
  }
}
