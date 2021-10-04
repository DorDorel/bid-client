import 'package:bid_client/models/product.dart';

class Bid {
  final String bidId;
  final String createdBy;
  final String date;
  final String clientMail;
  final String clientName;
  final double finalPrice;
  // List<SelectedProducts> selectedProducts = [];
  final String companyName;
  final String logoImageUrl;
  final String companyMail;
  final String companyPhone;
  final String companyAddress;
  final String companyWebsite;

  Bid({
    required this.bidId,
    required this.createdBy,
    required this.date,
    required this.clientName,
    required this.clientMail,
    required this.finalPrice,
    // required this.selectedProducts,
    required this.companyName,
    required this.companyMail,
    required this.logoImageUrl,
    required this.companyAddress,
    required this.companyPhone,
    required this.companyWebsite,
  });

  factory Bid.fromMap(Map<String, dynamic> firestoreObj) {
    String convertFromTimestampToDateTime(int timeStamp) {
      var date = DateTime.fromMillisecondsSinceEpoch(timeStamp).toString();
      return date;
    }

    Bid bidObject = Bid(
        bidId: firestoreObj['bidId'],
        createdBy: firestoreObj['createdBy'],
        date: convertFromTimestampToDateTime(
            firestoreObj['dateCreated']['nanos']),
        clientName: firestoreObj['clientName'],
        clientMail: firestoreObj['clientMail'],
        finalPrice: firestoreObj['finalPrice'],
        // selectedProducts: firestoreObj['selectedProducts'],
        companyName: firestoreObj['companyName'],
        logoImageUrl: firestoreObj['companyLogo'],
        companyMail: firestoreObj['companyMail'],
        companyPhone: firestoreObj['companyPhone'],
        companyAddress: firestoreObj['companyAddress'],
        companyWebsite: firestoreObj['companyWebsite']);

    return bidObject;
  }
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
