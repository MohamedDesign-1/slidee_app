import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faliures.dart';
import '../../data/models/fetch_profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Faliures, FetchProfileModelDto>> getProfile(String userId);
}
