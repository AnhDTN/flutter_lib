import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Validate on String {
  bool isPhone() {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(this)) {
      return true;
    } else {
      return false;
    }
  }

  String? validatePhone(BuildContext context) {
    String pattern = r'^(?:[+0][0-9])?[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(this)) {
      return null;
    } else {
      return AppLocalizations.of(context)?.invalidPhone;
    }
  }

  String? validatePassword(BuildContext context) {
    String pattern = r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})';
    RegExp regex = RegExp(pattern);
    if (length < 8) {
      return AppLocalizations.of(context)?.inputPasswordLess8Character;
    } else if (!regex.hasMatch(this)) {
      return AppLocalizations.of(context)?.inputPasswordWrongFormat;
    } else {
      return null;
    }
  }

  String? validateEmail(BuildContext context) {
    if (EmailValidator.validate(this)) {
      return null;
    } else {
      return AppLocalizations.of(context)?.invalidEmail;
    }
  }

  String? validateEmailOrPhone(BuildContext context) {
    if (!EmailValidator.validate(this) && !this.isPhone()) {
      return AppLocalizations.of(context)?.inputInvalidPhoneOrEmail;
    } else {
      return null;
    }
  }

  String hidePhone() {
    return replaceRange(5, 10, "*****");
  }

  String parseFromCountryPhone() {
    if (contains("+84")) return replaceFirst("+84", "0");
    return this;
  }

  String parseToCountryPhone() {
    if (startsWith("0")) return replaceFirst("0", "+84");
    return this;
  }
}