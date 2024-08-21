// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  int? id;
  final String username;
  String? email;
  final String password;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  UserEntity({
    required this.username,
    this.id,
    this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });
  @override
  List<Object?> get props => [
        id,
        email,
        password,
        username,
        firstName,
        lastName,
        image,
        token,
        gender
      ];
}
