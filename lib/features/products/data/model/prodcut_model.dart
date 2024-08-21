import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';

// ignore: must_be_immutable
class ProductModel extends ProductEntity {
  ProductModel(
      {super.id,
      super.title,
      super.images,
      super.price,
      super.desc,
      super.categ,
      super.brand,
      super.disCount,
      super.rating,
      super.stock,
      super.thumbnail});

  factory ProductModel.fromjson(Map<String, dynamic> jsonPro) {
    return ProductModel(
      brand: jsonPro['brand'] ?? '',
      categ: jsonPro['category'] ?? '',
      desc: jsonPro['description'] ?? '',
      disCount: jsonPro['discountPercentage'] ?? '',
      images: List<String>.from(jsonPro['images']) ?? [],
      price: jsonPro['price'] ?? '',
      rating: jsonPro['rating'] ?? '',
      stock: jsonPro['stock'] ?? '',
      thumbnail: jsonPro['thumbnail'] ?? '',
      title: jsonPro['title'] ?? '',
      id: jsonPro['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'image': thumbnail,
      'title': title,
    };
  }
}
