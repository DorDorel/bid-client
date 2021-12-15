import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ProductTable extends StatelessWidget {
  final AsyncSnapshot<Bid?> bidInfo;
  const ProductTable({Key? key, required this.bidInfo}) : super(key: key);

  String calcauteTax(double finalPrice) {
    double taxDeduction = (tax / 100) * finalPrice;
    return (finalPrice - taxDeduction).toString();
  }

  String calculateAllUnitBeforeTax(String finalPricePerUnit, String quantity) {
    double unitPrice = double.parse(finalPricePerUnit);
    int q = int.parse(quantity);
    String unitPriceWithotTax = calcauteTax(unitPrice);
    double doubleUnitPriceWithotTax = double.parse(unitPriceWithotTax);
    return (doubleUnitPriceWithotTax * q).toString();
  }

  String calcaulteFinalPrice(String finalPricePerUnit, String quantity) {
    double unitPrice = double.parse(finalPricePerUnit);
    int q = int.parse(quantity);
    return (unitPrice * q).toString();
  }

  List<DataRow> getAllProductsInDataRowObject() {
    List<DataRow> products = [];
    bidInfo.data!.selectedProducts.forEach((element) {
      final DataRow dataRow = DataRow(cells: [
        DataCell(Text(element.product.productName)),
        DataCell(Text(element.product.description)),
        DataCell(Image.network(
          element.product.imageUrl,
          width: 30.0,
          height: 30.0,
        )),
        DataCell(Text(element.quantity)),
        DataCell(Text(calcauteTax(double.parse(element.finalPricePerUnit)) +
            " " +
            currencySymbol)),
        DataCell(
          Text(element.finalPricePerUnit + " " + currencySymbol,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataCell(Text(calculateAllUnitBeforeTax(
                element.finalPricePerUnit, element.quantity) +
            " " +
            currencySymbol)),
        DataCell(Text(
            calcaulteFinalPrice(element.finalPricePerUnit, element.quantity) +
                " " +
                currencySymbol,
            style: TextStyle(fontWeight: FontWeight.bold)))
      ]);
      products.add(dataRow);
    });
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection direction = langDirection();
    return Directionality(
        textDirection: direction,
        child: DataTable(columns: [
          DataColumn(
              label: Text(
            "פריט",
          )),
          DataColumn(label: Text("תיאור")),
          DataColumn(label: Text("תמונה להמחשה")),
          DataColumn(label: Text("כמות")),
          DataColumn(label: Text("מחיר ליחידה \n(לא כולל מע״מ)")),
          DataColumn(
              label: Text(
            "מחיר ליחידה",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataColumn(label: Text("מחיר סופי \n(לא כולל מע״מ)")),
          DataColumn(
              label: Text(
            "מחיר סופי",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))
        ], rows: getAllProductsInDataRowObject()));
  }
}
