import 'package:ecommerce_app/core/database/db.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/presentation/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/category/presentation/bloc/bloc/categ_bloc.dart';
import 'package:ecommerce_app/features/category/presentation/ui/screens/category_screen.dart';
import 'package:ecommerce_app/features/pro%20details/presentation/bloc/add%20to%20cart/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/pro%20details/presentation/bloc/pro%20details/pro_details_bloc.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/signin/signin_bloc.dart';
import 'package:ecommerce_app/features/signup/presentation/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/get_it.dart' as getIt;
import 'package:flutter_bloc/flutter_bloc.dart';

late Size mediaQuery;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.init();

  await DatabaseHelper.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.sizeOf(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninBloc(signinUserUC: getIt.sl())),
        BlocProvider(
            create: (context) =>
                CategBloc(getAllCategUC: getIt.sl())..add(GetCategEvent())),
        BlocProvider(
            create: (context) => ProductsBloc(getproductsUC: getIt.sl())),
        BlocProvider(create: (context) => SignUpBloc(signUpUserUC: getIt.sl())),
        BlocProvider(
            create: (context) => ProDetailsBloc(getProDetailsUC: getIt.sl())),
        BlocProvider(create: (context) => AddToCartCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoryScreen(),
      ),
    );
  }
}
