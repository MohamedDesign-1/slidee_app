import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/faliures.dart';
import '../../data/models/fetch_profile_model.dart';
import '../repositories/get_profile_repository.dart';

@injectable
class FetchProfileUseCase {
  final ProfileRepository repository;

  FetchProfileUseCase(this.repository);

  Future<Either<Faliures, FetchProfileModelDto>> execute(String userId) {
    return repository.getProfile(userId);
  }
}
