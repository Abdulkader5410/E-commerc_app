import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategEntity extends Equatable {
  String name;
  String slug;

  CategEntity({required this.name , required this.slug});

  @override
  List<Object?> get props => [name , slug];
}
