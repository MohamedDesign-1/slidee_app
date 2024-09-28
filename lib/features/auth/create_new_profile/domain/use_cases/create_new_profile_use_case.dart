import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slidee_app/features/auth/create_new_profile/domain/repositories/create_new_profile_repository.dart';

import '../../../../../core/errors/faliures.dart';
import '../entities/profile_entity.dart';

@injectable
class CreateNewProfileUseCase {
  CreateNewProfileRepository createNewProfileRepository;
  CreateNewProfileUseCase({required this.createNewProfileRepository});

  Future<Either<Faliures, ProfileEntity>> call(String username, String displayName , String bio , String imageUrl) async {
    return await createNewProfileRepository.createNewProfile(username, displayName , bio , imageUrl);
  }
}