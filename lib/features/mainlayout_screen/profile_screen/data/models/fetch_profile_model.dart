import '../../domain/entities/fetch_profile_entity.dart';

import 'followers_model_dto.dart';

class FetchProfileModelDto extends FetchProfileEntity {
  final List<FollowersModel> followers;

  FetchProfileModelDto({
    required super.id,
    required super.username,
    required super.displayName,
    required super.bio,
    required super.imageUrl,
    required super.followersCount,
    required super.followingCount,
    required this.followers,
  });

  factory FetchProfileModelDto.fromJson(Map<String, dynamic> json) {
    var followersList = json['followers'] as List<dynamic>? ?? [];
    List<FollowersModel> followers = followersList
        .map((followerJson) => FollowersModel.fromJson(followerJson))
        .toList();

    return FetchProfileModelDto(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      displayName: json['displayName'] ?? '',
      bio: json['bio'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      followersCount: json['followersCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      followers: followers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'displayName': displayName,
      'bio': bio,
      'imageUrl': imageUrl,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'followers': followers.map((follower) => follower.toJson()).toList(),
    };
  }
}
