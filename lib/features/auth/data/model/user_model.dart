import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.password,
    required super.approved,
    required super.dateCreate,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['user_id'] ?? 0,
      name: map['user_name'] ?? '',
      email: map['user_email'] ?? '',
      phone: map['user_phone'] ?? '',
      password: map['user_password'] ?? '',
      approved: map['user_approved'] ?? 0,
      dateCreate: map['user_date_create'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': id,
      'user_name': name,
      'user_email': email,
      'user_phone': phone,
      'user_password': password,
      'user_approved': approved,
      'user_date_create': dateCreate,
    };
  }
}
