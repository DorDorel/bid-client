import 'package:bid_client/models/product.dart';

class Bid {
  String bidId;
  String createdBy;
  DateTime date;
  String clientMail;
  String clientName;
  double finalPrice;
  List<SelectedProducts> selectedProducts = [];

  Bid({
    required this.bidId,
    required this.createdBy,
    required this.date,
    required this.clientName,
    required this.clientMail,
    required this.finalPrice,
    required this.selectedProducts,
  });
}

class SelectedProducts {
  Product product;
  int quantity;
  int discount;
  double finalPricePerUnit;

  int warrantyMonths;
  String remark;

  SelectedProducts(
      {required this.product,
      required this.quantity,
      required this.discount,
      required this.finalPricePerUnit,
      required this.warrantyMonths,
      required this.remark});

  Map<String, dynamic> toMap() => {
        'product': this.product.toMap(),
        'quantity': this.quantity,
        'discount': this.discount,
        'finalPricePerUnit': this.finalPricePerUnit,
        'warrantyMonths': this.warrantyMonths,
        'remark': this.remark
      };
}

List<Map<String, dynamic>> parserSelectedProduct(
    List<SelectedProducts> spList) {
  List<Map<String, dynamic>> spListConverted = [];
  spList.forEach((product) {
    final Map<String, dynamic> productConverted = product.toMap();
    spListConverted.add(productConverted);
  });

  return spListConverted;
}
