part of 'product_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsEvent {
  final String name;
  const GetProductsEvent({required this.name});

  @override
  List<Object> get props => [name];
}

class RefreshProductsEvent extends ProductsEvent {
  @override
  List<Object> get props => [];
}
