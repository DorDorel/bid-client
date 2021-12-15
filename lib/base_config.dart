import 'package:flutter/material.dart';

const bool active_rtl = true;

TextDirection langDirection() {
  return active_rtl ? TextDirection.rtl : TextDirection.ltr;
}

const Color appBarColor = Color(0xff011627);
const String currencySymbol = "₪";
const int tax = 17;
