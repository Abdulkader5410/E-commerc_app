part of 'categ_bloc.dart';

sealed class CategState extends Equatable {
  const CategState();

  @override
  List<Object> get props => [];
}

final class CategInitial extends CategState {}

class LoadingCategState extends CategState {
  @override
  List<Object> get props => [];
}

class LoadedCategState extends CategState {
  final List<CategEntity> categs;

  const LoadedCategState({required this.categs});
  @override
  List<Object> get props => [];
}

class ErrorCategState extends CategState {
  final String errMsg;

  const ErrorCategState({required this.errMsg});
  @override
  List<Object> get props => [];
}
