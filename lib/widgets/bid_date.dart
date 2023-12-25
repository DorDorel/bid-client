import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BidDate extends StatelessWidget {
  final Bid bidInfo;
  const BidDate({
    Key? key,
    required this.bidInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd.MM.yyyy \n   HH:mm').format(bidInfo.date);

    return Container(
      padding: EdgeInsets.only(left: 8.0),
      child: Text(
        date,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
