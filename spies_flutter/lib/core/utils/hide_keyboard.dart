import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin HideKeyboard {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
