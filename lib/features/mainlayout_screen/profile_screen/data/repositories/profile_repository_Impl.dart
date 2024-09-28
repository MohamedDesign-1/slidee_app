import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/faliures.dart';
import '../../domain/repositories/get_profile_repository.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../models/fetch_profile_model.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Faliures, FetchProfileModelDto>> getProfile(String userId) async {
    final result = await dataSource.fetchProfile(userId);
    return result;
  }
}