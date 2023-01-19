import 'package:bid_client/base_config.dart';
import 'package:bid_client/const/hebrew_text.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

Widget intro({required Bid bidInfo}) {
  return Directionality(
    textDirection: langDirection(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.bottomRight,
        child: Text(
          "${bidInfo.clientName + ' ' + introText}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
