import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/signup/domain/usecase/signup_usecase.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUserUC signUpUserUC;

  SignUpBloc({required this.signUpUserUC}) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpUserEvent) {
        emit(LoadingSignUpState());
        final messageOrFailure = await signUpUserUC(event.user);
        emit(_eitherMessageOrFailure(messageOrFailure, event.user));
      }
    });
  }

  SignUpState _eitherMessageOrFailure(
      Either<Failure, Unit> either, UserEntity user) {
    return either.fold(
      (failure) => ErrorSignUpState(message: _mapFailureType(failure)),
      (posts) => SuccessSignUpState(user: user),
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
