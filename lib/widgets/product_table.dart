import 'package:bid_client/base_config.dart';
import 'package:bid_client/models/bid.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  final AsyncSnapshot<Bid?> bidInfo;
  const ProductTable({Key? key, required this.bidInfo}) : super(key: key);

  bool renderWarrantyMonthsColum() {
    if (double.parse(bidInfo.data!.selectedProducts.first.warrantyMonths) > 0) {
      return true;
    }
    return false;
  }

  String calculateTax(double finalPrice) {
    double taxDeduction = (tax / 100) * finalPrice;
    return (finalPrice - taxDeduction).toStringAsFixed(2);
  }

  String calculateAllUnitBeforeTax(String finalPricePerUnit, String quantity) {
    double unitPrice = double.parse(finalPricePerUnit);
    int q = int.parse(quantity);
    String unitPriceWithoutTax = calculateTax(unitPrice);
    double doubleUnitPriceWithoutTax = double.parse(unitPriceWithoutTax);
    return (doubleUnitPriceWithoutTax * q).toStringAsFixed(2);
  }

  String calculateFinalPrice(String finalPricePerUnit, String quantity) {
    double unitPrice = double.parse(finalPricePerUnit);
    int q = int.parse(quantity);
    return (unitPrice * q).toStringAsFixed(2);
  }

  List<DataRow> getAllProductsInDataRowObject() {
    List<DataRow> products = [];
    bidInfo.data!.selectedProducts.forEach((element) {
      final DataRow dataRow = DataRow(cells: [
        DataCell(Text(element.product.productName)),
        DataCell(Text(element.product.description)),
        DataCell(Text(element.warrantyMonths)),
        DataCell(Image.network(
          element.product.imageUrl,
          width: 30.0,
          height: 30.0,
        )),
        DataCell(Text(element.quantity)),
        DataCell(Text(calculateTax(double.parse(element.finalPricePerUnit)) +
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
            calculateFinalPrice(element.finalPricePerUnit, element.quantity) +
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columns: [
          DataColumn(
              label: Text(
            "????????",
          )),
          DataColumn(label: Text("??????????")),
          DataColumn(label: Text("?????????? ????????????")),
          DataColumn(label: Text("?????????? ????????????")),
          DataColumn(label: Text("????????")),
          DataColumn(label: Text("???????? ???????????? \n(???? ???????? ????????)")),
          DataColumn(
              label: Text(
            "???????? ????????????",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataColumn(label: Text("???????? ???????? \n(???? ???????? ????????)")),
          DataColumn(
              label: Text(
            "???????? ????????",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))
        ], rows: getAllProductsInDataRowObject()),
      ),
    );
  }
}
