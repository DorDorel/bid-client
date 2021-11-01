import 'package:bid_client/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final double totalSum;

  ProductCard(
      {Key? key,
      required this.product,
      required this.quantity,
      required this.totalSum})
      : super(key: key);
  final SizedBox space = SizedBox(
    width: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Row(
        children: [
          Text(product.productName,
              style: TextStyle(fontWeight: FontWeight.bold)),
          space,
          Text(product.price.toString()),
          space,
          Image.network(
            product.imageUrl,
            width: 30,
            height: 90,
          ),
          space,
          Text(product.description),
          space,
          Text(quantity.toString()),
          space,
          Text(totalSum.toString())
        ],
      ),
    );
  }
}
