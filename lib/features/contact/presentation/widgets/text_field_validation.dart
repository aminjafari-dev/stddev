/// Extension on the String class for adding validation methods
extension ValidationExtensions on String {
  /// Validates an email address based on a regular expression pattern
  String? get emailValidate {
    // Regular expression pattern for email validation
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (isEmpty) {
      return "Please enter your email";
    } else if (!regex.hasMatch(this)) {
      return 'Your email is not valid';
    }

    return null; // Validation successful
  }

  /// Validates the size of a string value
  String? stringSize(String value) {
    if (isEmpty) {
      return 'Please fill this';
    } else if (value.length < 3) {
      return 'Your value is not acceptable';
    }

    return null; // Validation successful
  }

  /// Validates a mobile number based on a regular expression pattern
  String? get phoneValidate {
    // Regular expression pattern for mobile number validation
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(this)) {
      return 'Your mobile number is not valid';
    }

    return null; // Validation successful
  }
}
