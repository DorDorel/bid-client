import 'package:flutter/material.dart';

const bool active_rtl = false;

TextDirection langDirection() {
  return active_rtl ? TextDirection.rtl : TextDirection.ltr;
}
