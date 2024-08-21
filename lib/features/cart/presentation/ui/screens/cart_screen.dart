import 'package:ecommerce_app/core/database/db.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/presentation/ui/widgets/cart_widget.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<int> getCartLength() async {
    List<Map<String, dynamic>> cart = [];

    cart = await DatabaseHelper.getCart();
    return cart.length;
  }

  List<Map<String, dynamic>> products = [];

  void getproducts() async {
    products = await DatabaseHelper.getPro();
  }

  List<Map<String, dynamic>> cart = [];

  void getcart() async {
    cart = await DatabaseHelper.getCart();
  }

  double totalPrices = 0.0;

  Future<double> getTotalPrices() async {
    totalPrices = await DatabaseHelper.getTotalPriceInCart();

    return totalPrices;
  }

  int totalQun = 0;

  Future<int> getTotalQun() async {
    totalQun = await DatabaseHelper.getTotalQunInCart();

    return totalQun;
  }

  @override
  Widget build(BuildContext context) {
    getcart();
    getproducts();

    getTotalPrices();
    getTotalQun();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder(
                future: getCartLength(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("itemCount: snapshot.data ${snapshot.data}");
                    return ListView.builder(
                      itemCount: snapshot.data,
                      itemBuilder: (context, index) {
                        return CartWidget(
                            cart: cart[index],
                            product: ProductModel(
                              title: products[index]['title'],
                              thumbnail: products[index]['image'],
                              price: products[index]['price'],
                            ),
                            qun: cart[index]['qun']);
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("No Items"),
                    );
                  }
                }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            height: mediaQuery.height / 3.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FutureBuilder(
                      future: getTotalPrices(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "Total Price : ${snapshot.data}",
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          );
                        } else {
                          return const Text(
                            "Total Price : 0.0",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          );
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FutureBuilder(
                      future: getTotalQun(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "Total Quntity : ${snapshot.data}",
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          );
                        } else {
                          return const Text(
                            "Total Quntity : 0 ",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          );
                        }
                      }),
                ),
                Container(
                  height: 50,
                  width: mediaQuery.width,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ])

        // bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        //   builder: (context, state) {
        //     if (state is CartLoadedState) {
        //       return Container(
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 const Text("Total Products  :   "),
        //                 Text("${state.cart.totalProducts}"),
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 const Text("Total Quantity  :   "),
        //                 Text("${state.cart.totalQun}"),
        //               ],
        //             )
        //             const Row(
        //               children: [
        //                 Text("Total Price  :   "),
        //                 Text("10000"),
        //               ],
        //             ),
        //           ],
        //         ),
        //       );
        //     } else {
        //       return Container(
        //         color: Colors.green,
        //       );
        //     }
        //   },
        // ),
        );
  }
}
