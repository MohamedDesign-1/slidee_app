import 'package:slidee_app/features/auth/login_screen/domain/entities/login_entity.dart';

class LoginModelDto extends LoginEntity{
  LoginModelDto({required super.email, required super.password});

  factory LoginModelDto.fromJson(Map<String, dynamic> json) {
    return LoginModelDto(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}