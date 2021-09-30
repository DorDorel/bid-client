class Product {
  final String productId;
  final String productName;
  final double price;
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
    Product productObj = Product(
        productId: firestoreObj['productId'],
        productName: firestoreObj['productName'],
        price: firestoreObj['price'],
        imageUrl: firestoreObj['imageUrl'],
        description: firestoreObj['description']);

    return productObj;
  }
}
