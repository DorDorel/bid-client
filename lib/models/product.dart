class Product {
  final String productId;
  final String productName;
  final String price;
  final String imageUrl;
  final String description;

  Product(
      {required this.productId,
      required this.productName,
      required this.price,
      required this.imageUrl,
      required this.description});

  Map<String, dynamic> toMap() => {
        'productId': this.productId,
        'productName': this.productName,
        'price': this.price,
        'imageUrl': this.imageUrl,
        'description': this.description
      };

  factory Product.fromMap(Map<String, dynamic> firestoreObj) {
    if (firestoreObj['price']["integerValue"] != "Null") {
      Product productObj = Product(
          productId: firestoreObj['productId']["stringValue"],
          productName: firestoreObj['productName']["stringValue"],
          price: firestoreObj['price']["integerValue"],
          imageUrl: firestoreObj['imageUrl']["stringValue"],
          description: firestoreObj['description']["stringValue"]);

      return productObj;
    }

    Product productObj = Product(
        productId: firestoreObj['productId']["stringValue"],
        productName: firestoreObj['productName']["stringValue"],
        price: firestoreObj['price']["doubleValue"],
        imageUrl: firestoreObj['imageUrl']["stringValue"],
        description: firestoreObj['description']["stringValue"]);

    return productObj;
  }
}
