import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:ecommerce_app/features/products/domain/entity/pro_response_entity.dart';

// ignore: must_be_immutable
class ProResModel extends ProResEntity {
  ProResModel(
      {required super.limit,
      required super.products,
      required super.skip,
      required super.total});

  factory ProResModel.fromjson(Map<String, dynamic> jsonPro) {
    List<dynamic> proList = jsonPro['products'];
    List<ProductModel> products =
        proList.map((e) => ProductModel.fromjson(e)).toList();

    return ProResModel(
      // title: jsonPro['title'],
      // images: List<String>.from(jsonPro['images']),
      // price: jsonPro['price'],
      // desc: jsonPro['description'],
      // categ: CategModel.fromjson(jsonPro['category']),
      limit: jsonPro['limit'],
      products: products,
      skip: jsonPro['skip'],
      total: jsonPro['total'],
    );
  }
}
