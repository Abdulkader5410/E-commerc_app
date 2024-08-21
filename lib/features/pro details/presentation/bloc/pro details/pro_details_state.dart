part of 'pro_details_bloc.dart';

sealed class ProDetailsState extends Equatable {
  const ProDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProDetailsState {}

class LoadingProDetailsState extends ProDetailsState {
  @override
  List<Object> get props => [];
}

class LoadedProDetailsState extends ProDetailsState {
  final ProductEntity product;

  const LoadedProDetailsState({required this.product});
  @override
  List<Object> get props => [];
}

class ErrorProDetailsState extends ProDetailsState {
  final String errMsg;

  const ErrorProDetailsState({required this.errMsg});
  @override
  List<Object> get props => [];
}
