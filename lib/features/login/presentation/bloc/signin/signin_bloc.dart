import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/login/domain/usecase/signin_usecase.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SignInState> {
  final SignInUserUC signinUserUC;

  SigninBloc({required this.signinUserUC}) : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      if (event is SigninUserEvent) {
        emit(LoadingSignInState());
        final messageOrFailure = await signinUserUC(event.user);
        emit(_eitherMessageOrFailure(messageOrFailure, event.user));
      }
    });
  }

  SignInState _eitherMessageOrFailure(
      Either<Failure, Unit> either, UserEntity user) {
    return either.fold(
      (failure) => ErrorSignInState(message: _mapFailureType(failure)),
      (posts) => SuccessSignInState(user: user),
    );
  }

  String _mapFailureType(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case OfflineFailure:
        return SERVER_FAILURE_MESSAGE;

      default:
        return "Unexpcted Error";
    }
  }
}
