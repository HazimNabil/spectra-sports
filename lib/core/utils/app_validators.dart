class AppValidators {
  static String? requiredFieldValidator(String? text) {
    if (text?.isEmpty ?? true) {
      return 'This field is required';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email?.isEmpty ?? true) {
      return 'Please enter your email address';
    } else if (!emailRegex.hasMatch(email!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password?.isEmpty ?? true) {
      return 'Please enter your password';
    } else if (password!.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? phoneNumberValidator(String? phoneNumber) {
    final phoneNumberRegex = RegExp(r'^01(0|1|2|5)[0-9]{8}$');
    if (phoneNumber?.isEmpty ?? true) {
      return 'Please enter your password';
    } else if (!phoneNumberRegex.hasMatch(phoneNumber!)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
