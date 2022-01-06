import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

bool isSmallScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < smallScreenSize;

bool isMediumScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumScreenSize &&
    MediaQuery.of(context).size.width < largeScreenSize;

bool isLargeScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= largeScreenSize;

bool isCustomSize(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumScreenSize &&
    MediaQuery.of(context).size.width <= customScreenSize;
