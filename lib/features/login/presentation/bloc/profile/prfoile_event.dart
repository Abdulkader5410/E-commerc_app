import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetProfileEvent extends ProfileEvent {
  int userId;
  GetProfileEvent({required this.userId});
}
