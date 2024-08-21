import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';

// ignore: must_be_immutable
class ProductModel extends ProductEntity {
  ProductModel(
      {super.id,
      required super.title,
      super.images,
      super.price,
      super.desc,
      required super.categ,
      super.brand,
      super.disCount,
      super.rating,
      super.stock,
      super.thumbnail});

  factory ProductModel.fromjson(Map<String, dynamic> jsonPro) {
    return ProductModel(
      // title: jsonPro['title'],
      // images: List<String>.from(jsonPro['images']),
      // price: jsonPro['price'],
      // desc: jsonPro['description'],
      // categ: CategModel.fromjson(jsonPro['category']),
      brand: jsonPro['brand'],
      categ: jsonPro['category'],
      desc: jsonPro['description'],
      disCount: jsonPro['discountPercentage'],
      images: List<String>.from(jsonPro['images']),
      price: jsonPro['price'],
      rating: jsonPro['rating'],
      stock: jsonPro['stock'],
      thumbnail: jsonPro['thumbnail'],
      title: jsonPro['title'],
      id: jsonPro['id'],
    );
  }
}
