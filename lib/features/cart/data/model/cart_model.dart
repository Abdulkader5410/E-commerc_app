import 'package:ecommerce_app/features/cart/domain/entity/cart_entity.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';

// ignore: must_be_immutable
class CartModel extends CartEntity {
  CartModel({
    super.cartId,
    super.proId,
    super.qun,
  });

  factory CartModel.fromjson(Map<String, dynamic> jsonCart) {
    List<dynamic> proList = jsonCart['products'];
    List<ProductModel> products =
        proList.map((e) => ProductModel.fromjson(e)).toList();

    return CartModel(
      cartId: jsonCart['id_cart'],
      proId: jsonCart['id_pro'],
      qun: jsonCart['qun'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_cart': cartId,
      'id_pro': proId,
      'qun': qun,
    };
  }
}
