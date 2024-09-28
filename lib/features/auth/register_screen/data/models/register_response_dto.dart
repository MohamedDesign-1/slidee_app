import 'package:slidee_app/features/auth/register_screen/domain/entities/register_user_entity.dart';

class RegisterResponseDto extends RegisterUserEntity{
  RegisterResponseDto({required super.name, required super.email, required super.uId, });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDto(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}