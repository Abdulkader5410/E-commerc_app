import 'package:ecommerce_app/features/cart/presentation/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/category/presentation/bloc/bloc/categ_bloc.dart';
import 'package:ecommerce_app/features/category/presentation/ui/widgets/category_widget.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/features/products/presentation/ui/screens/products_screen.dart';
import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String getImage(String name) {
    if (name.contains("beauty")) {
      return "assets/images/img_beauty.png";
    }
    if (name.contains("fragrances")) {
      return "assets/images/img_fragrances.png";
    }
    if (name.contains("mobile")) {
      return "assets/images/img_mobile.png";
    }
    if (name.contains("laptop")) {
      return "assets/images/img_laptop.png";
    }
    if (name.contains("perfurm")) {
      return "assets/images/img_perfurm.png";
    }
    if (name.contains("skincare")) {
      return "assets/images/img_skincare.png";
    }
    if (name.contains("georcy")) {
      return "assets/images/img_georcy.png";
    }
    if (name.contains("home")) {
      return "assets/images/img_home.png";
    }
    if (name.contains("funiture")) {
      return "assets/images/img_funiture.png";
    }
    if (name.contains("women dress")) {
      return "assets/images/img_wo_dress.png";
    }
    if (name.contains("women shoes")) {
      return "assets/images/img_wo_shoes.png";
    }
    if (name.contains("men shirt")) {
      return "assets/images/img_men_shirt.png";
    }
    if (name.contains("men shoes")) {
      return "assets/images/img_men_shoes.png";
    }
    if (name.contains("men watch")) {
      return "assets/images/img_men_watch.png";
    }
    if (name.contains("women watch")) {
      return "assets/images/img_wo_watch.png";
    }
    if (name.contains("women bag")) {
      return "assets/images/img_wo_bag.png";
    }
    if (name.contains("jellwry")) {
      return "assets/images/img_jellwry.png";
    }
    if (name.contains("glass")) {
      return "assets/images/img_glass.png";
    }
    if (name.contains("automative")) {
      return "assets/images/automative.png";
    }
    if (name.contains("motor")) {
      return "assets/images/img_motor.png";
    }
    if (name.contains("lighting")) {
      return "assets/images/img_lighting.png";
    } else {
      return "assets/images/img_lighting.png";
    }
  }

  List<String> imagesSearch = [];
  List<String> namesSearch = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "E-commerce App",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: BlocBuilder<CategBloc, CategState>(builder: (context, state) {
        if (state is LoadedCategState) {
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
                      for (int i = 0; i < state.categs.length; i++) {
                        if (state.categs[i].name.contains(value)) {
                          imagesSearch.add(getImage(state.categs[i].slug));
                          namesSearch.add(state.categs[i].name);
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
                      hintText: "Search on Categories . . . ",
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      isSearching ? namesSearch.length : state.categs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ProductsBloc>().add(
                            GetProductsEvent(name: state.categs[index].name));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductsScreen(),
                            ));
                      },
                      child: CategoryWidget(
                        // image: categImages[index],
                        image: isSearching
                            ? imagesSearch[index]
                            : getImage(state.categs[index].slug),
                        name: isSearching
                            ? namesSearch[index]
                            : state.categs[index].name,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is LoadingCategState) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.black,
          ));
        } else if (state is ErrorCategState) {
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
