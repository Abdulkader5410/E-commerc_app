part of 'pro_details_bloc.dart';

sealed class ProDetailsEvent extends Equatable {
  const ProDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetProDetailsEvent extends ProDetailsEvent {
  final int id;
  const GetProDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
