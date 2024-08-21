import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';
import 'package:ecommerce_app/features/products/domain/usecase/get_products_usecase.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUC getproductsUC;

  ProductsBloc({required this.getproductsUC}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(LoadingProductsState());
        final products = await getproductsUC(event.name);
        print("||||||||||||||||||||||||| $products");
        products.fold((failure) {
          print("FFFFFFFFF      $failure ");
          emit(ErrorProductsState(errMsg: _mapFailureType(failure)));
        }, (products) {
          print("CCCCCCCCCCC      $products ");

          emit(LoadedProductsState(products: products));
        });
      }
    });
  }

  String _mapFailureType(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case EmptyFailure:
        return SERVER_FAILURE_MESSAGE;

      case OfflineFailure:
        return SERVER_FAILURE_MESSAGE;

      default:
        return "Unexpcted Error";
    }
  }
}
