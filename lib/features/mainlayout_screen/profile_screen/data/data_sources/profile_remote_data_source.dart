import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faliures.dart';
import '../models/fetch_profile_model.dart';

abstract class ProfileDataSource {
  Future<Either<Faliures, FetchProfileModelDto>> fetchProfile(String userId);
}