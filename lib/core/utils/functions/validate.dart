import 'package:flutter/services.dart';
 

class Validate {
  //MARK:Input formater
  static FilteringTextInputFormatter priceFormater =
      FilteringTextInputFormatter.allow(
    RegExp(r'^\d+\.?\d{0,2}$'),
  );
  static FilteringTextInputFormatter numberOnlyFormater =
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));

  static LengthLimitingTextInputFormatter maxLengthFormater(int length) =>
      LengthLimitingTextInputFormatter(length);

  //=============
  static RegExp upperCaseRegex = RegExp(r'[A-Z]');
  static RegExp lowerCaseRegex = RegExp(r'[a-z]');
  static RegExp egyptionPhoneNumberRegex =
      RegExp(r'^(?:[0][1][0125])[0-9]{8}$');
  static RegExp phoneNumberRegex = RegExp(r'^\+?[0-9]{10,15}$');
  static RegExp digit = RegExp(r'\d');
  static RegExp specialChar = RegExp(r'[^A-Za-z0-9]');
  static RegExp userNameReg = RegExp(r"^[a-zA-Z\-'\s]+$");
//   bool hasLowercase(String password) => RegExp(r'[a-z]').hasMatch(password);
// bool hasUppercase(String password) => RegExp(r'[A-Z]').hasMatch(password);
// bool hasDigit(String password) => RegExp(r'\d').hasMatch(password);
// bool hasSpecialChar(String password) => RegExp(r'[^A-Za-z0-9]').hasMatch(password);
  static RegExp fileExtensionRegExp = RegExp(
    r'\.(jpg|jpeg|png|bmp|webp|svg|pdf|word|docx?)$',
  );

  static RegExp imgExtensionRegExp = RegExp(
    r'\.(jpg|jpeg|png|bmp|webp|svg?)$',
  );

  /// email validation
  static RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  ///validation Functions
  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    } else if (!name.contains(upperCaseRegex)) {
      return ("Name must contain Uppercase letter");
    } else if (!name.contains(lowerCaseRegex)) {
      return ("Name must contain Lowercase letter");
    } else {
      return null;
    }
  }

  static String? nationalNotEmpty(String val) {
    if (val.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (val.length != 14) {
      return "National id must be 14 Numbers";
    }

    return null;
  }

  static String? userNameValidation(String name) {
    if (name.trim().isEmpty) {
      return 'Name can not be empty';
    } else if (name.trim().length < 3) {
      return 'Name must be at least 3 characters long.';
    } else if ((name.trim().split(RegExp(r'\s+'))).length < 2) {
      return 'Please enter your full name (first and last name).';
    } else if (!userNameReg.hasMatch(name.trim())) {
      return "Name must only include letters , - , ' \n Numbers and other special characters are not allowed.";
    } else {
      return null;
    }
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email can not be empty';
    }
    if (!emailRegex.hasMatch(email)) {
      return 'Email not valid';
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password can not be empty';
    } else if (password.length < 8) {
      return 'Password shoud be more than 8 character';
    } else if (!digit.hasMatch(password)) {
      return 'Password must contain at least one number.';
    } else if (!upperCaseRegex.hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.';
    } else if (!lowerCaseRegex.hasMatch(password)) {
      return 'Password must contain at least one lowercase letter.';
    } else if (!specialChar.hasMatch(password)) {
      return 'Password must contain at least one special character.';
    } else {
      return null;
    }
  }

  static String? notEmpty(String val) {
    if (val.isEmpty) {
      return 'This field can not be empty';
    }

    return null;
  }

  static String? notEmptyPinCode(String val) {
    if (val.isEmpty) {
      return 'Empty';
    }

    return null;
  }

  static String? validatePhoneNumber(String? number) {
     if (!phoneNumberRegex.hasMatch(number ?? "")) {
      return 'Invalid mobile number';
    }
    if (number == null || number.isEmpty) {
      return 'Number is required';
    }
    return null;
  }
}
