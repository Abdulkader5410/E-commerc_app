import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/cart/data/data_repo/cart_data_repo.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/domain/dom_repo/cart_dom_repo.dart';
import 'package:ecommerce_app/features/cart/domain/usecase/get_pro_details_usecase.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/features/category/data/data_repo/categ_data_repo.dart';
import 'package:ecommerce_app/features/category/data/data_source/categ_remote_data_source.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';
import 'package:ecommerce_app/features/category/domain/usecase/create_categ_usecase.dart';
import 'package:ecommerce_app/features/category/domain/usecase/delete_categ_usecase.dart';
import 'package:ecommerce_app/features/category/domain/usecase/get_all_categ_usecase.dart';
import 'package:ecommerce_app/features/category/domain/usecase/get_one_categ_usecase.dart';
import 'package:ecommerce_app/features/category/domain/usecase/upadate_categ_usecase.dart';
import 'package:ecommerce_app/features/category/presentation/bloc/bloc/categ_bloc.dart';
import 'package:ecommerce_app/features/pro%20details/data/data_repo/pro_details_data_repo.dart';
import 'package:ecommerce_app/features/pro%20details/data/data_source/pro_details_remote_data_source.dart';
import 'package:ecommerce_app/features/pro%20details/domain/dom_repo/pro_details_dom_repo.dart';
import 'package:ecommerce_app/features/pro%20details/domain/usecase/get_pro_details_usecase.dart';
import 'package:ecommerce_app/features/pro%20details/presentation/bloc/pro%20details/pro_details_bloc.dart';
import 'package:ecommerce_app/features/products/data/data_repo/products_data_repo.dart';
import 'package:ecommerce_app/features/products/data/data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products/domain/dom_repo/products_dom_repo.dart';
import 'package:ecommerce_app/features/products/domain/usecase/get_products_usecase.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:ecommerce_app/features/login/data/data_repo/login_data_repo.dart';
import 'package:ecommerce_app/features/login/data/data_source/login_local_data_source.dart';
import 'package:ecommerce_app/features/login/data/data_source/login_remote_data_source.dart';
import 'package:ecommerce_app/features/login/domain/dom_repo/dom_repo.dart';
import 'package:ecommerce_app/features/login/domain/usecase/delete_account_usecase.dart';
import 'package:ecommerce_app/features/login/domain/usecase/get_user_profile_usecase.dart';
import 'package:ecommerce_app/features/login/domain/usecase/signin_usecase.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/profile/prfoile_bloc.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/signin/signin_bloc.dart';
import 'package:ecommerce_app/features/signup/data/data_repo/signup_data_repo.dart';
import 'package:ecommerce_app/features/signup/data/data_source/signup_local_data_source.dart';
import 'package:ecommerce_app/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:ecommerce_app/features/signup/domain/dom_repo/signup_dom_repo.dart';
import 'package:ecommerce_app/features/signup/domain/usecase/signup_usecase.dart';
import 'package:ecommerce_app/features/signup/presentation/bloc/signup/signup_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc

  sl.registerFactory(() => SigninBloc(signinUserUC: sl()));
  sl.registerFactory(() => ProfileBloc(getUserProfileUC: sl()));
  sl.registerFactory(() => CategBloc(getAllCategUC: sl()));
  sl.registerFactory(() => ProductsBloc(getproductsUC: sl()));
  sl.registerFactory(() => SignUpBloc(signUpUserUC: sl()));
  sl.registerFactory(() => ProDetailsBloc(getProDetailsUC: sl()));
  sl.registerFactory(() => CartBloc(getCartUC: sl()));

//usecase

  sl.registerFactory(() => SignInUserUC(userDomRepo: sl()));
  sl.registerFactory(() => DeleteAccountUC(userDomRepo: sl()));
  sl.registerFactory(() => GetUserProfileUC(userDomRepo: sl()));

  sl.registerFactory(() => GetAllCategUC(categDomRepo: sl()));
  sl.registerFactory(() => GetOneCategeUC(categDomRepo: sl()));
  sl.registerFactory(() => DeleteCategUC(categDomRepo: sl()));
  sl.registerFactory(() => CreateCategUC(categDomRepo: sl()));
  sl.registerFactory(() => UpdateCategUC(categDomRepo: sl()));

  sl.registerFactory(() => GetProductsUC(progDomRepo: sl()));

  sl.registerFactory(() => SignUpUserUC(signupDomRepo: sl()));

  sl.registerFactory(() => GetProDetailsUC(proDetailsDomRepo: sl()));

  sl.registerFactory(() => GetCartUC(cartDomRepo: sl()));

//repo

  sl.registerFactory<UserDomRepo>(() => UserDataRepo(
      networkinfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerFactory<CategDomRepo>(
      () => CategDataRepo(networkinfo: sl(), remoteDataSource: sl()));

  sl.registerFactory<ProductsDomRepo>(
      () => ProductsDataRepo(networkinfo: sl(), remoteDataSource: sl()));

  sl.registerFactory<SignUpDomRepo>(() => SignUpDataRepo(
      networkinfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerFactory<ProDetailsDomRepo>(() => ProDetailsDataRepo(
        networkinfo: sl(),
        remoteDataSource: sl(),
      ));

  sl.registerFactory<CartDomRepo>(() => CartDataRepo(
        networkinfo: sl(),
        remoteDataSource: sl(),
      ));

  //datasource

  sl.registerFactory<DioConsumer>(() => DioConsumer(dio: sl()));

  sl.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(dio: sl()));

  sl.registerFactory<CategRemoteDataSource>(
      () => CategRemoteDataSourceImpl(dio: sl()));

  sl.registerFactory<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sp: sl()));

  sl.registerFactory<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(dio: sl()));

  sl.registerFactory<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSourceImpl(dio: sl()));

  sl.registerFactory<SignUpLocalDataSource>(
      () => SignUpLocalDataSourceImpl(sp: sl()));

  sl.registerFactory<ProDetailsRemoteDataSource>(
      () => ProDetailsRemoteDataSourceImpl(dio: sl()));

  sl.registerFactory<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(dio: sl()));

  //// core

  sl.registerFactory<Networkinfo>(() => NetworkinfoImpl(netCheck: sl()));

  //// external

  SharedPreferences sp = await SharedPreferences.getInstance();
  sl.registerFactory(() => sp);

  sl.registerFactory(() => InternetConnectionChecker());

  sl.registerFactory(() => Dio());
}
