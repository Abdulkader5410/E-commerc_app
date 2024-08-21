part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartEvent extends CartEvent {
  final int userId;
  const GetCartEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}


class IncQunEvent extends CartEvent {
  final int userId;
  const IncQunEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}

class DecQunEvent extends CartEvent {
  final int userId;
  const DecQunEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}