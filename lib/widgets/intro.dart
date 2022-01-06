import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

Widget intro(AsyncSnapshot<Bid?> bidInfo) {
  return Directionality(
    textDirection: langDirection(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.bottomRight,
        child: Text(
          "${bidInfo.data!.clientName} שלום רב,\nלאחרונה ביקשת מאיתנו הצעה לתמחור. להלן ההצעה הטובה ביותר שלנו:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
