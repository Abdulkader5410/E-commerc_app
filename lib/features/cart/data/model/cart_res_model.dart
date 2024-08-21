import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_res_entity.dart';


// ignore: must_be_immutable
class CartResModel extends CartResEntity {
  CartResModel(
      {required super.limit,
      required super.carts,
      required super.skip,
      required super.total});

  factory CartResModel.fromjson(Map<String, dynamic> jsonCart) {
    
    List<dynamic> cartList = jsonCart['carts'];
    List<CartModel> carts =
        cartList.map((e) => CartModel.fromjson(e)).toList();

    return CartResModel(
      // title: jsonPro['title'],
      // images: List<String>.from(jsonPro['images']),
      // price: jsonPro['price'],
      // desc: jsonPro['description'],
      // categ: CategModel.fromjson(jsonPro['category']),
      limit: jsonCart['limit'],
      carts: carts,
      skip: jsonCart['skip'],
      total: jsonCart['total'],
    );
  }
}
