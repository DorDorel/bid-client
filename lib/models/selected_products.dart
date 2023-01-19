import 'package:bid_client/models/product.dart';

class SelectedProducts {
  Product product;
  String quantity;
  String discount;
  String finalPricePerUnit;
  String warrantyMonths;
  String remark;

  SelectedProducts({
    required this.product,
    required this.quantity,
    required this.discount,
    required this.finalPricePerUnit,
    required this.warrantyMonths,
    required this.remark,
  });

  Map<String, dynamic> toMap() => {
        'product': this.product.toMap(),
        'quantity': this.quantity,
        'discount': this.discount,
        'finalPricePerUnit': this.finalPricePerUnit,
        'warrantyMonths': this.warrantyMonths,
        'remark': this.remark
      };

  factory SelectedProducts.fromMap(Map<String, dynamic> firestoreObj) {
    final jsonShortcut = firestoreObj["mapValue"]["fields"];
    if (jsonShortcut["finalPricePerUnit"]["integerValue"] != "Null") {
      SelectedProducts selectedProducts = SelectedProducts(
        product: Product.fromMap(jsonShortcut["product"]["mapValue"]["fields"]),
        quantity: jsonShortcut["quantity"]["integerValue"],
        discount: jsonShortcut["discount"]["integerValue"],
        finalPricePerUnit:
            jsonShortcut["finalPricePerUnit"]["integerValue"].toString(),
        warrantyMonths: jsonShortcut["warrantyMonths"]["integerValue"],
        remark: jsonShortcut["remark"]["stringValue"],
      );
      return selectedProducts;
    }
    SelectedProducts selectedProducts = SelectedProducts(
      product: Product.fromMap(jsonShortcut["product"]["mapValue"]["fields"]),
      quantity: jsonShortcut["quantity"]["integerValue"],
      discount: jsonShortcut["discount"]["integerValue"],
      finalPricePerUnit:
          jsonShortcut["finalPricePerUnit"]["doubleValue"].toString(),
      warrantyMonths: jsonShortcut["warrantyMonths"]["integerValue"],
      remark: jsonShortcut["remark"]["stringValue"],
    );
    return selectedProducts;
  }
}

List<SelectedProducts> parserSelectedProduct(
    Map<String, dynamic> firestoreObj) {
  List<SelectedProducts> newSelectedProductList = [];
  final productInJson = firestoreObj["selectedProduct"]["values"];
  productInJson.forEach((product) {
    final p = SelectedProducts.fromMap(product);
    newSelectedProductList.add(p);
  });

  return newSelectedProductList;
}

List<Map<String, dynamic>> convertSelectedProduct(
    List<SelectedProducts> spList) {
  List<Map<String, dynamic>> spListConverted = [];
  spList.forEach((product) {
    final Map<String, dynamic> productConverted = product.toMap();
    spListConverted.add(productConverted);
  });

  return spListConverted;
}
