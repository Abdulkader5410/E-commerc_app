import 'package:ecommerce_app/core/database/db.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  addToCart(ProductModel productModel) async {
    try {
      emit(AddToCartLoading());

      await DatabaseHelper.addPro(ProductModel(
        title: productModel.title,
        price: productModel.price,
        thumbnail: productModel.thumbnail,
      ).toJson());

      List<Map<String, dynamic>> products = await DatabaseHelper.getPro();

      await DatabaseHelper.addCart(CartModel(
        proId: products[products.length - 1]['id_pro'],
        qun: 1,
      ).toJson());

      emit(AddToCartSuccess());
    } on Exception catch (e) {
      emit(AddToCartFailure(errMsg: e.toString()));
    }
  }
}
