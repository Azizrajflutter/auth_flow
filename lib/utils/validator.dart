class Validator {
  static String? validateName(String? value, {String? error = 'Name'}) {
    if (value == null || value.isEmpty) {
      return '$error is requird.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is requird.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is requird.';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 chracters long.';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required.';
    }

    if (value != password) {
      return 'Passwords do not match.';
    }

    return null;
  }

  static String? textLength({
    String? value,
    int? length = 8,
    required String error,
  }) {
    if (value == null || value.isEmpty) {
      return '$error is required';
    }

    if (value.length < length!) {
      return '$error must be at least $length chracters long.';
    }

    return null;
  }
}
