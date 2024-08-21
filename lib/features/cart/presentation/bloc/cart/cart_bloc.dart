import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/usecase/get_pro_details_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUC getCartUC;

  CartBloc({required this.getCartUC}) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is GetCartEvent) {
        emit(CartLoadingState());
        final cart = await getCartUC(event.userId);
        print("||||||||||||||||||||||||| $cart");
        cart.fold((failure) {
          print("FFFFFFFFF      $failure ");
          emit(CartErrorState(errMsg: _mapFailureType(failure)));
        }, (cart) {
          print("CCCCCCCCCCC      $cart ");

          emit(CartLoadedState(cart: cart));
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
