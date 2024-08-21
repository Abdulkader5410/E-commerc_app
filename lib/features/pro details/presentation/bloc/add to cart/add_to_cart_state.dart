import 'package:equatable/equatable.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {}

final class AddToCartFailure extends AddToCartState {
  final String errMsg;

  const AddToCartFailure({required this.errMsg});
  @override
  List<Object> get props => [errMsg];
}
