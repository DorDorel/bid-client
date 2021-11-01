import 'package:bid_client/models/bid.dart';
import 'package:bid_client/widgets/product_card.dart';
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
        alignment: Alignment.topLeft,
        child: Column(
            crossAxisAlignment:
                active_rtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              space,
              Text(
                bidInfo.data!.companyName,
                textDirection: langDirection(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                bidInfo.data!.companyAddress,
                textDirection: TextDirection.rtl,
              ),
              Text(bidInfo.data!.companyPhone, textDirection: langDirection()),
              Text(bidInfo.data!.companyWebsite,
                  textDirection: langDirection()),
              space,
              Text(
                "Hi Brandon,",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "You recently requested a bid from our company.\n"
                "Here is our best offer for you:",
                style: TextStyle(fontSize: 16),
              ),
              space,
              Card(
                child: Row(
                  children: [
                    Text("Product Name"),
                    tableHeaderSpace,
                    Text("Price peer unit"),
                    tableHeaderSpace,
                    Text("Image"),
                    tableHeaderSpace,
                    Text("Description"),
                    tableHeaderSpace,
                    Text("Final Price")
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: bidInfo.data!.selectedProducts.length,
                itemBuilder: (_, index) => Column(
                  children: [
                    ProductCard(
                        product: bidInfo.data!.selectedProducts[index].product,
                        quantity: int.parse(
                            bidInfo.data!.selectedProducts[index].quantity),
                        totalSum: totalSumCalculate(
                            int.parse(
                                bidInfo.data!.selectedProducts[index].quantity),
                            double.parse(bidInfo.data!.selectedProducts[index]
                                .finalPricePerUnit)))
                  ],
                ),
              )
            ]));
  }
}
