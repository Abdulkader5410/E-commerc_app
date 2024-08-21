import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  int? id;
  String? title;
  dynamic? price;
  String? desc;
  String? categ;
  List<String>? images;
  dynamic? rating;
  dynamic? stock;
  dynamic? qun;
  String? brand;
  String? thumbnail;
  dynamic? disCount;

  ProductEntity({
    this.id,
     this.title,
    this.images,
    this.price,
    this.desc,
    this.brand,
    this.disCount,
    this.rating,
    this.stock,
    this.thumbnail,
     this.categ,
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
