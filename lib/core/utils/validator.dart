class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'Enter your email address.';
    } else if (!emailRegex.hasMatch(val)) {
      return 'This Email is not valid (e.g., example@example.com).';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only';
    } else if (val.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.[a-zA-Z])(?=.[0-9])');
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'Weak Password';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return "Password doesn't match";
    } else {
      return null;
    }
  }
}
