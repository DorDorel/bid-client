import 'package:bid_client/models/bid.dart';
import 'package:bid_client/widgets/agent_info.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            tenantInfo(bidInfo: bidInfo),
            const SizedBox(height: 12.0),
            // Main title
            mainTitle(bidInfo: bidInfo),
            const SizedBox(height: 12.0),
            intro(bidInfo: bidInfo),
            ProductTable(bidInfo: bidInfo),
            const SizedBox(height: 12.0),
            totalSum(bidInfo: bidInfo),
            const SizedBox(height: 48.0),
            agentInfo(bidInfo: bidInfo)
          ],
        ),
      ),
    );
  }
}
