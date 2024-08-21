part of 'product_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class LoadingProductsState extends ProductsState {


  @override
  List<Object> get props => [];
}

class LoadedProductsState extends ProductsState {
  final List<ProductEntity> products;

  const LoadedProductsState({required this.products});
  @override
  List<Object> get props => [];
}

class ErrorProductsState extends ProductsState {
  final String errMsg;

  const ErrorProductsState({required this.errMsg});
  @override
  List<Object> get props => [];
}
