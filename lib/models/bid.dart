import 'package:bid_client/models/selected_products.dart';

class Bid {
  final String bidId;
  final String createdBy;
  final DateTime date;
  final String clientMail;
  final String clientName;
  final double finalPrice;
  List<SelectedProducts> selectedProducts = [];
  final String companyName;
  final String logoImageUrl;
  final String companyMail;
  final String companyPhone;
  final String companyAddress;
  final String companyWebsite;
  final String creatorName;
  final String creatorPhone;
  final String creatorMail;

  Bid(
      {required this.bidId,
      required this.createdBy,
      required this.date,
      required this.clientName,
      required this.clientMail,
      required this.finalPrice,
      required this.selectedProducts,
      required this.companyName,
      required this.companyMail,
      required this.logoImageUrl,
      required this.companyAddress,
      required this.companyPhone,
      required this.companyWebsite,
      required this.creatorName,
      required this.creatorPhone,
      required this.creatorMail});

  factory Bid.fromMap(Map<String, dynamic> firestoreObj) {
    DateTime convertFromTimestampToDateTime() {
      int seconds = int.parse(firestoreObj['dateCreated']['seconds']);
      int nanos = firestoreObj['dateCreated']['nanos'];
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          seconds * 1000 + nanos ~/ 1000000);
      return date;
    }

    Bid bidObject = Bid(
      bidId: firestoreObj['bidId'],
      createdBy: firestoreObj['createdBy'],
      date: convertFromTimestampToDateTime(),
      clientName: firestoreObj['clientName'],
      clientMail: firestoreObj['clientMail'],
      finalPrice: firestoreObj['finalPrice'],
      selectedProducts: parserSelectedProduct(firestoreObj),
      companyName: firestoreObj['companyName'],
      logoImageUrl: firestoreObj['companyLogo'],
      companyMail: firestoreObj['companyMail'],
      companyPhone: firestoreObj['companyPhone'],
      companyAddress: firestoreObj['companyAddress'],
      companyWebsite: firestoreObj['companyWebsite'],
      creatorName: firestoreObj['creatorName'],
      creatorPhone: firestoreObj['creatorPhone'],
      creatorMail: firestoreObj['creatorMail'],
    );
    return bidObject;
  }
}
