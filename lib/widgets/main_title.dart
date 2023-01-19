import 'package:bid_client/base_config.dart';
import 'package:bid_client/const/hebrew_text.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mainTitle({required Bid bidInfo}) {
  return Container(
    padding: EdgeInsets.only(right: 10),
    alignment: Alignment.center,
    child: Text(
      bidNumTitle +
          " " +
          bidInfo.bidId +
          " " +
          from +
          " " +
          bidInfo.companyName,
      style: GoogleFonts.sofia(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      textDirection: langDirection(),
      textAlign: TextAlign.right,
    ),
  );
}
