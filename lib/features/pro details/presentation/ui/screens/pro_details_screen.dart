import 'dart:developer';

import 'package:ecommerce_app/core/database/db.dart';
import 'package:ecommerce_app/core/utilities/snakBar.dart';
import 'package:ecommerce_app/features/cart/presentation/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/pro%20details/presentation/bloc/add%20to%20cart/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/pro%20details/presentation/bloc/pro%20details/pro_details_bloc.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';
import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add to cart/add_to_cart_state.dart';

class ProDetailsScreen extends StatelessWidget {
  final idPro;

  const ProDetailsScreen({super.key, required this.idPro});

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.sizeOf(context);

    context.read<ProDetailsBloc>().add(GetProDetailsEvent(id: idPro));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Product Details"),
      ),
      body: BlocBuilder<ProDetailsBloc, ProDetailsState>(
          builder: (context, state) {
        print(state);
        if (state is LoadedProDetailsState) {
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Colors.black,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ])),
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                Positioned(
                    top: 20,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        state.product.brand!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    )),
                Positioned(
                    top: 60,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        state.product.title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  top: 240,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 32),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.yellow,
                                          size: 25,
                                        ),
                                        Text(
                                          "${state.product.rating}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("${state.product.price}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                        const Text(" \$",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Description :",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                    child: Text(state.product.desc!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Discount : ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Discount for this product is  :   ${state.product.disCount}%      ",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Stock : ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Avialable  :  ${state.product.stock} ",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        // border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(state.product.thumbnail!),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is LoadingProDetailsState) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black,
          ));
        } else if (state is ErrorProDetailsState) {
          return Text(state.errMsg);
        } else {
          return Container(
            color: Colors.red,
          );
        }
      }),
      bottomNavigationBar: BlocBuilder<ProDetailsBloc, ProDetailsState>(
        builder: (context, state) {
          if (state is LoadedProDetailsState) {
            return GestureDetector(
              onTap: () {
                print("Start Db");

                // final item = CartItemModel(
                //     price: state.product.price,
                //     namePro: state.product.title,
                //     qun: 1);
                // CartDbHelper.instance.addCartItem(item);
                // print("Added from Product Details Screen ");
                // context.read<CartBloc>().add(AddProduct(item));

                context.read<AddToCartCubit>().addToCart(ProductModel(
                      id: state.product.id,
                      title: state.product.title,
                      thumbnail: state.product.thumbnail,
                      price: state.product.price,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Container(
                  height: 50,
                  width: mediaQuery.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                  child: GestureDetector(
                    child: Center(
                      child: BlocConsumer<AddToCartCubit, AddToCartState>(
                        listener: (context, state) {
                          if (state is AddToCartSuccess) {
                            ShowSnakBar().MessageSnakBar(
                                context: context,
                                message: "Product added to cart");

                           
                          } else if (state is AddToCartFailure) {
                            ShowSnakBar().MessageSnakBar(
                                context: context, message: "Try again");
                          }
                        },
                        builder: (context, state) {
                          if (state is AddToCartLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ));
                          } else if (state is AddToCartSuccess) {
                            return const Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            );
                          }
                          return const Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const CartScreen(),
                      //     ));
                    },
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
