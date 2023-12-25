import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget totalSum({required Bid bidInfo}) {
  return Container(
    padding: EdgeInsets.only(left: 10.0),
    alignment: Alignment.bottomLeft,
    child: Row(
      children: [
        Text(
          '₪' + NumberFormat('#,##0.00').format(bidInfo.finalPrice),
          style: TextStyle(
            backgroundColor: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          " :הסכום הכולל בהצעת מחיר זו ",
          style: TextStyle(
            backgroundColor: Colors.yellowAccent,
          ),
        ),
      ],
    ),
  );
}
