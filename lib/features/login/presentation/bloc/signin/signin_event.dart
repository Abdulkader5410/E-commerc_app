part of 'signin_bloc.dart';

sealed class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}



class SigninUserEvent extends SigninEvent {
  final UserEntity user;

  const SigninUserEvent({required this.user});
  @override
  List<Object> get props => [user];
}

