import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/register_screen/data/data_sources/remote/register_remote_data_source.dart';

import 'package:slidee_app/features/auth/register_screen/domain/entities/register_user_entity.dart';

import '../../domain/repositories/register_repository.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepositoryImpl(this.registerRemoteDataSource);

  @override
  Future<Either<Faliures, RegisterUserEntity>> createAccount(String email, String password , String name) async {
    var either = await registerRemoteDataSource.createAccount(email, password , name);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

}