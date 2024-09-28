import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/create_new_profile/data/remote/data_sources/create_new_profile_remote_data_source.dart';
import 'package:slidee_app/features/auth/create_new_profile/data/remote/models/profile_model.dart';

@Injectable(as: CreateNewProfileRemoteDataSource)
class CreateNewProfileRemoteDateSourceImpl implements CreateNewProfileRemoteDataSource {
  @override
  Future<Either<Faliures, ProfileModelDto>> createNewProfile(
      String username,
      String displayName,
      String bio,
      String imageUrl) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final profileSnapshot = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Profile')
        .doc('profile');

    try {
      await profileSnapshot.set({
        'username': username,
        'displayName': displayName,
        'bio': bio,
        'imageUrl': imageUrl,
        'followersCount': 0,
        'followingCount': 0,
      });

      return Right(ProfileModelDto(
          id: userId,
          username: username,
          displayName: displayName,
          bio: bio,
          imageUrl: imageUrl
      ));
    } catch (e) {
      return Left(Faliures(errorMessage: e.toString()));
    }
  }

}
