import 'dart:convert';

class CategoryModel {
  int? categoryId;
  String? categoryTitle;
  String? imageFile;

  CategoryModel({
    this.categoryId,
    this.categoryTitle,
    this.imageFile,
  });

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["CategoryId"],
        categoryTitle: json["CategoryTitle"] ?? '',
        imageFile: json["ImageFile"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "CategoryId": categoryId,
        "CategoryTitle": categoryTitle,
        "ImageFile": imageFile,
      };
}
