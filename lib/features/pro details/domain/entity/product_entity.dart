import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  int? id;
  String title;
  dynamic price;
  String desc;
  String categ;
  List<String> images;
  dynamic rating;
  dynamic stock;
  String brand;
  String thumbnail;
  dynamic disCount;

  ProductEntity({
    this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.desc,
    required this.brand,
    required this.disCount,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.categ,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        desc,
        price,
        images,
        categ,
        rating,
        disCount,
        thumbnail,
        stock,
        brand
      ];
}
