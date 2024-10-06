class TextValidator {
  final String validationType;

  TextValidator(this.validationType);

  // Define the call method
  String? call(String value) {
    if (validationType == 'email') {
      return _validateEmail(value);
    } else if (validationType == 'username') {
      return _validateUsername(value);
    } else if (validationType == 'password') {
      return _validatePassword(value);
    }
    return null;
  }

  // Email validation logic
  String? _validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Username validation logic
  String? _validateUsername(String username) {
    if (username.isEmpty || username.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

  // Password validation logic
  String? _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
