// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyExists":
            MessageLookupByLibrary.simpleMessage("Email already exists"),
        "emailRequired": MessageLookupByLibrary.simpleMessage(
            "Please enter your email address"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalidCode": MessageLookupByLibrary.simpleMessage("Invalid code"),
        "invalidConfirmPassword": MessageLookupByLibrary.simpleMessage(
            "Password and Confirm Password must be the same"),
        "invalidCredentials": MessageLookupByLibrary.simpleMessage(
            "Email or password is incorrect"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address"),
        "invalidNationalId": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid Citizen ID/Passport"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters long"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "nationalId":
            MessageLookupByLibrary.simpleMessage("Citizen ID/Passport"),
        "nationalIdAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Citizen ID/Passport already exists"),
        "nationalIdNotFound": MessageLookupByLibrary.simpleMessage(
            "Citizen ID/Passport not found"),
        "nationalIdRequired": MessageLookupByLibrary.simpleMessage(
            "Please enter your Citizen ID/Passport"),
        "notification": MessageLookupByLibrary.simpleMessage("Notification"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "resendCodeIn": MessageLookupByLibrary.simpleMessage("Resend code in"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again later"),
        "subWelcome": MessageLookupByLibrary.simpleMessage(
            "Creating a better world together"),
        "verificationEmailMessage1":
            MessageLookupByLibrary.simpleMessage("An email has been sent to "),
        "verificationEmailMessage2": MessageLookupByLibrary.simpleMessage(
            ". Please check and verify your email to continue registering for an account"),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "verifyEmail": MessageLookupByLibrary.simpleMessage("Verify Email"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome to CitiZen!")
      };
}
