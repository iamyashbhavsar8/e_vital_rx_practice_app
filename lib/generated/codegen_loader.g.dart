// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en_US = {
  "dark": "Dark",
  "light": "Light",
  "systemDefault": "System Default",
  "emptyField": "This field should not be empty!",
  "contactValidation": "Enter a valid contact number!",
  "usernameValidation": "Enter a valid user name!",
  "passwordValidation": "Enter a valid Password!",
  "enterPhoneNumber": "Enter phone number",
  "enterUserName": "Enter Username",
  "enterPassword": "Enter Password",
  "submit": "Submit",
  "login": "Login",
  "loginMsg": "Login successfully!",
  "somethingWentWrong": "Something went wrong!",
  "update": "Update",
  "cancel": "Cancel",
  "updateRupee": "Update Rupee Value",
  "rupeeValidation": "Rupee should be between 1 to 100",
  "noMoreData": "No more data",
  "eVital": "eVitalRx",
  "unAuthorized": "Unauthorized User",
  "fieldRequired": "All fields are required.",
  "showUtmValue": "Show UTM Value",
  "hideUtmValue": "Hide UTM Value"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": _en_US};
}
