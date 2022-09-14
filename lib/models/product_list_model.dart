class ProductListModel {
  int? productId;
  String? productName;
  double? salePrice;
  int? categoryId;
  String? imageFile;
  String? description;
  ProductListModel({
    this.productId,
    this.productName,
    this.salePrice,
    this.categoryId,
    this.imageFile,
    this.description,
  });

  ProductListModel.fromJson(dynamic json) {
    productId = json['ProductId'];
    productName = json['ProductName'] ?? 'no name';
    salePrice = json['SalePrice'];
    categoryId = json['CategoryId'];
    imageFile = json['ImageFile'] ?? '';
    description = json['Description'] ?? 'no description';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ProductId'] = productId;
    map['ProductName'] = productName;
    map['SalePrice'] = salePrice;
    map['CategoryId'] = categoryId;
    map['ImageFile'] = imageFile;
    map['Description'] = description;
    return map;
  }
}
