import 'package:bid_client/models/bid.dart';
import 'package:bid_client/widgets/agent_info.dart';
import 'package:bid_client/widgets/intro.dart';
import 'package:bid_client/widgets/product_table.dart';
import 'package:flutter/material.dart';

import '../base_config.dart';

class BidDetails extends StatelessWidget {
  final AsyncSnapshot<Bid?> bidInfo;
  BidDetails({required this.bidInfo});

  double totalSumCalculate(int quantity, double unitPrice) =>
      quantity * unitPrice;

  final SizedBox space = SizedBox(
    height: 20,
  );

  final SizedBox tableHeaderSpace = SizedBox(
    width: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
          crossAxisAlignment:
              active_rtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            space,
            Text(
              bidInfo.data!.companyName,
              textDirection: langDirection(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              bidInfo.data!.companyAddress,
              textDirection: TextDirection.rtl,
            ),
            Text(bidInfo.data!.companyPhone, textDirection: langDirection()),
            Text(bidInfo.data!.companyWebsite, textDirection: langDirection()),
            space,
            intro(bidInfo),
            space,
            ProductTable(
              bidInfo: bidInfo,
            ),
            space,
            Text(
              "סכום כולל להצעת המחיר: ${bidInfo.data!.finalPrice}" +
                  " " +
                  currencySymbol,
              textDirection: langDirection(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: appBarColor),
            ),
            space,
            space,
            space,
            Center(child: agentInfo(bidInfo)),
          ]),
    );
  }
}
