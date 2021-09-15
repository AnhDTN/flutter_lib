import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirebaseError {
  static String getFirebaseErrorByCode(BuildContext context,String code) {
    switch (code) {
      case "expired-action-code":
        return AppLocalizations.of(context)!.expiredActionCode;
      case "invalid-action-code":
        return AppLocalizations.of(context)!.invalidActionCode;
      case "user-disabled":
        return AppLocalizations.of(context)!.userDisabled;
      case "user-not-found":
        return AppLocalizations.of(context)!.userNotFound;
      case "weak-password":
        return AppLocalizations.of(context)!.weakPassword;
      case "email-already-in-use":
        return AppLocalizations.of(context)!.emailAlreadyInUser;
      case "invalid-email":
        return AppLocalizations.of(context)!.invalidEmail;
      case "operation-not-allowed":
        return AppLocalizations.of(context)!.operationNotAllowed;
      case "account-exists-with-different-credential":
        return AppLocalizations.of(context)!.accountExistsWithDifferentCredential;
      case "timeout":
        return AppLocalizations.of(context)!.timeout;
      case "wrong-password":
        return AppLocalizations.of(context)!.wrongPassword;
      case "invalid-verification-code":
        return AppLocalizations.of(context)!.invalidVerificationCode;
      case "invalid-verification-id":
        return AppLocalizations.of(context)!.invalidVerificationId;
      case "popup-blocked":
        return AppLocalizations.of(context)!.popupBlocked;
      case "null-user":
        return AppLocalizations.of(context)!.nullUser;
      case "user-token-expired":
        return AppLocalizations.of(context)!.userTokenExpired;
      case "invalid-user-token":
        return AppLocalizations.of(context)!.invalidUserToken;
      default:
        return AppLocalizations.of(context)!.expiredActionCode;
    }
  }
}
