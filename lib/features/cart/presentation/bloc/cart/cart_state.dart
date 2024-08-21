part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  final CartEntity cart;

  const CartLoadedState({required this.cart});
  @override
  List<Object> get props => [];
}

class CartUpdateQunState extends CartState {
  final int qun;

  const CartUpdateQunState({required this.qun});
  @override
  List<Object> get props => [qun];
}

class CartUpdatePriceState extends CartState {
  final dynamic price;

  const CartUpdatePriceState({required this.price});
  @override
  List<Object> get props => [price];
}

class CartErrorState extends CartState {
  final String errMsg;

  const CartErrorState({required this.errMsg});
  @override
  List<Object> get props => [];
}
