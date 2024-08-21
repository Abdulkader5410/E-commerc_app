import 'package:ecommerce_app/features/pro%20details/presentation/ui/screens/pro_details_screen.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/features/products/presentation/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<String> imagesSearch = [];
  List<String> namesSearch = [];
  List<dynamic> pricesSearch = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("Products"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        if (state is LoadedProductsState) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        imagesSearch.clear();
                        namesSearch.clear();
                        namesSearch = [];
                        imagesSearch = [];
                        isSearching = false;
                      });
                    } else {
                      setState(() {
                        isSearching = true;
                      });
                      for (int i = 0; i < state.products.length; i++) {
                        if (state.products[i].title!.contains(value)) {
                          imagesSearch.add(state.products[i].images![0]);
                          namesSearch.add(state.products[i].title!);
                          pricesSearch.add(state.products[i].price!);
                        }
                      }
                    }
                  },
                  onSaved: (newValue) {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      hintText: "Search on Products . . .",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      isSearching ? namesSearch.length : state.products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProDetailsScreen(
                                  idPro: state.products[index].id),
                            ));
                      },
                      child: ProductWidget(
                        price: isSearching
                            ? pricesSearch[index]
                            : state.products[index].price,
                        image: isSearching
                            ? imagesSearch[index]
                            : state.products[index].images![0],
                        name: isSearching
                            ? namesSearch[index]
                            : state.products[index].title,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is LoadingProductsState) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black,
          ));
        } else if (state is ErrorProductsState) {
          return Text(state.errMsg);
        } else {
          return Container(
            color: Colors.red,
          );
        }
      }),
      // bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
