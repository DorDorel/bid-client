import 'package:bid_client/models/bid.dart';
import 'package:bid_client/widgets/agent_info.dart';
import 'package:bid_client/widgets/bid_date.dart';
import 'package:bid_client/widgets/intro.dart';
import 'package:bid_client/widgets/main_title.dart';
import 'package:bid_client/widgets/product_table.dart';
import 'package:bid_client/widgets/tenant_info.dart';
import 'package:bid_client/widgets/total_sum.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Bid bidInfo;
  const Home({
    Key? key,
    required this.bidInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 794,
          height: 1123,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
            border: Border.all(
              color: Colors.black38,
              width: 1, // Border thickness
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BidDate(bidInfo: bidInfo),
                    tenantInfo(bidInfo: bidInfo),
                  ],
                ),
                const SizedBox(height: 12.0),
                // Main title
                mainTitle(bidInfo: bidInfo),
                const SizedBox(height: 12.0),
                intro(bidInfo: bidInfo),
                const SizedBox(height: 12.0),
                ProductTable(bidInfo: bidInfo),
                const SizedBox(height: 12.0),
                totalSum(bidInfo: bidInfo),
                const SizedBox(height: 48.0),
                agentInfo(bidInfo: bidInfo)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
