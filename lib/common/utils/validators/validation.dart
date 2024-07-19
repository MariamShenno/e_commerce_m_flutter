

import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';

class MValidator {
  const MValidator._();

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "NameisRequired".tr(context);
    }
    // Check if the name contains symbols or numbers
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>0-9]').hasMatch(value)) {
      return "NameCannotContainSymbolsOrNumbers".tr(context);
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "InvalidEmailAddress".tr(context);
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "PasswordisRequired".tr(context);
    }
    // Check for minimum password length
    if (value.length < 6) {
      return "PasswordMustBeAtLeast6CharactersLong".tr(context);
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "PasswordMustContainAtLeastOneUppercaseLetter".tr(context);
    }
    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "PasswordMustContainAtLeastOneNumber".tr(context);
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "PasswordMustContainAtLeastOneSpecialCharacter".tr(context);
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "PhoneNumberisRequired".tr(context);
    }

    // Regular expression for phone number validation
    // (assuming a 10-digit KSA phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return "InvalidPhoneNumberFormat(10DigitsRequired)".tr(context);
    }
    return null;
  }
}
