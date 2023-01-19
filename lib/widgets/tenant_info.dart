import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

Widget tenantInfo({required Bid bidInfo}) {
  return Directionality(
    textDirection: langDirection(),
    child: Container(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          Text(
            bidInfo.companyName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(bidInfo.companyAddress),
          Text(bidInfo.companyPhone),
          Text(bidInfo.companyMail),
          Text(bidInfo.companyWebsite)
        ],
      ),
    ),
  );
}
