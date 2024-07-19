import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final int approved;
  final String dateCreate;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.approved,
    required this.dateCreate,
  });

  @override
  List<Object?> get props => [id, email, phone];
}
