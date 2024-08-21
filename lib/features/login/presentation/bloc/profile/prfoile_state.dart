
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class PrfoileInitial extends ProfileState {}



final class LoadingProfileState extends ProfileState {}

final class LoadedrofileState extends ProfileState {
  final UserEntity user;

  const LoadedrofileState({required this.user});

  @override
  List<Object> get props => [user];
}

final class ErrorProfileState extends ProfileState {
  final String message;

  const ErrorProfileState({required this.message});

  @override
  List<Object> get props => [message];
}
