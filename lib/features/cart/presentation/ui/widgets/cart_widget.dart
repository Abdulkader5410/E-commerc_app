import 'package:ecommerce_app/core/database/db.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  final ProductModel product;
  int qun;
  final Map<String, dynamic> cart;

  CartWidget({
    super.key,
    required this.product,
    required this.qun,
    required this.cart,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(widget.product.thumbnail!))),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    maxLines: 2,
                    widget.product.title!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.product.price!}\$",
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Container(
              width: 30,
              height: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.qun = widget.qun + 1;
                        });

                        Map<String, dynamic> c = {
                          'id_cart': widget.cart['id_cart'],
                          'id_pro': widget.cart['id_pro'],
                          'qun': widget.qun,
                        };
                        DatabaseHelper.updateCart(c);
                        DatabaseHelper.getCart().then((value) => print(value));
                      },
                      child: const Icon(Icons.add_circle)),
                  Text("${widget.qun}"),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.qun != 1) {
                            widget.qun = widget.qun - 1;
                            Map<String, dynamic> c = {
                              'id_cart': widget.cart['id_cart'],
                              'id_pro': widget.cart['id_pro'],
                              'qun': widget.qun,
                            };
                            DatabaseHelper.updateCart(c);
                            DatabaseHelper.getCart()
                                .then((value) => print(value));
                          }
                        });
                      },
                      child: const Icon(Icons.remove_circle)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
