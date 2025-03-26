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

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }  else {
      return null;
    }
  }
  
  static String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'Enter numbers only';
    } 
    // else if (val.trim().length != 11) {
    //   return 'Invalid phone number format for any country';
    // } 
    else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (!passwordRegex.hasMatch(val)) {
      return 'Password must be at least 8 characters long and include at least one uppercase letter and one number';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return "password doesn't match";
    } else {
      return null;
    }
  }
}
