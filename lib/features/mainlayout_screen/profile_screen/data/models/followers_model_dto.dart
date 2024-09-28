import '../../domain/entities/followers_entity.dart';

class FollowersModel extends FollowersEntity {
  FollowersModel({
    required super.followerId,
    required super.followerName,
  });

  factory FollowersModel.fromJson(Map<String, dynamic> json) {
    return FollowersModel(
      followerId: json['followerId'] ?? '',
      followerName: json['followerName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'followerId': followerId,
      'followerName': followerName,
    };
  }
}
