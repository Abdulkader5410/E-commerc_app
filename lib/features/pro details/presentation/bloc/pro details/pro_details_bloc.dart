import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/pro%20details/domain/usecase/get_pro_details_usecase.dart';
import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

part 'pro_details_event.dart';
part 'pro_details_state.dart';

class ProDetailsBloc extends Bloc<ProDetailsEvent, ProDetailsState> {
  final GetProDetailsUC getProDetailsUC;

  ProDetailsBloc({required this.getProDetailsUC}) : super(ProductsInitial()) {
    on<ProDetailsEvent>((event, emit) async {
      if (event is GetProDetailsEvent) {
        emit(LoadingProDetailsState());
        final product = await getProDetailsUC(event.id);
        product.fold((failure) {
          emit(ErrorProDetailsState(errMsg: _mapFailureType(failure)));
        }, (product) {

          emit(LoadedProDetailsState(product: product));
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
