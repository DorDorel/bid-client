import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

class BidDetails extends StatelessWidget {
  final AsyncSnapshot<Bid?> bidInfo;
  BidDetails({required this.bidInfo});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          Text(
            bidInfo.data!.companyName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(bidInfo.data!.companyAddress),
          Text(bidInfo.data!.companyPhone),
          Text(bidInfo.data!.companyWebsite),
          Text(bidInfo.data!.selectedProducts.first.product.productName),
        ],
      ),
    );
  }
}
