import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';
import 'package:ecommerce_app/features/category/domain/usecase/get_all_categ_usecase.dart';
import 'package:equatable/equatable.dart';

part 'categ_event.dart';
part 'categ_state.dart';

class CategBloc extends Bloc<CategEvent, CategState> {
  final GetAllCategUC getAllCategUC;

  CategBloc({required this.getAllCategUC}) : super(CategInitial()) {
    on<CategEvent>((event, emit) async {
      if (event is GetCategEvent) {
        emit(LoadingCategState());
        final allCategs = await getAllCategUC();
        print("||||||||||||||||||||||||| $allCategs");
        allCategs.fold((failure) {
          print("FFFFFFFFF      $failure ");
          emit(ErrorCategState(errMsg: _mapFailureType(failure)));
        }, (categs) {
          print("CCCCCCCCCCC      $categs ");

          emit(LoadedCategState(categs: categs));
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
