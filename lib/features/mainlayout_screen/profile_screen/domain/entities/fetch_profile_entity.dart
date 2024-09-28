class FetchProfileEntity {
  final String id;
  final String username;
  final String displayName;
  final String bio;
  final String imageUrl;
  final int followersCount;
  final int followingCount;


  FetchProfileEntity({
    required this.id,
    required this.username,
    required this.displayName,
    required this.bio,
    required this.imageUrl,
    required this.followersCount,
    required this.followingCount,
  });
}