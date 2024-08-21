
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/strings/failure.dart';
import 'package:ecommerce_app/features/login/domain/usecase/get_user_profile_usecase.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/profile/prfoile_event.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/profile/prfoile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent , ProfileState> {
  final GetUserProfileUC getUserProfileUC;

  ProfileBloc({required this.getUserProfileUC}) : super(PrfoileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileEvent ) {
        emit(LoadingProfileState());

        final userOrFailure = await getUserProfileUC(event.userId);

        userOrFailure.fold(
          (failure) {
            emit(ErrorProfileState(message: _mapFailureType(failure)));
          },
          (user) {
            emit(LoadedrofileState(user: user));
          },
        );
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
