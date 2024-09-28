import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/faliures.dart';
import '../../models/fetch_profile_model.dart';
import '../profile_remote_data_source.dart';

@Injectable(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<Either<Faliures, FetchProfileModelDto>> fetchProfile(String userId) async {
    try {
      final profileSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('Profile')
          .doc('profile')
          .get();

      if (profileSnapshot.exists) {
        return Right(FetchProfileModelDto.fromJson(profileSnapshot.data()!));
      } else {
        return Left(Faliures(errorMessage: 'Profile not found'));
      }
    } catch (e) {
      return Left(Faliures(errorMessage: e.toString()));
    }
  }
}
