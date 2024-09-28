import 'package:slidee_app/features/auth/create_new_profile/domain/entities/profile_entity.dart';

class ProfileModelDto extends ProfileEntity{

  ProfileModelDto({
    required super.id,
    required super.username,
    required super.displayName,
    required super.bio,
    required super.imageUrl,
  });
  factory ProfileModelDto.fromJson(Map<String, dynamic> json) {
    return ProfileModelDto(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      displayName: json['displayName'] ?? '',
      bio: json['bio'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'displayName': displayName,
      'bio': bio,
      'imageUrl': imageUrl,
    };
  }

}