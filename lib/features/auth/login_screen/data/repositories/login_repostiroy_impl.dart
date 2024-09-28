
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/login_screen/data/data_sources/login_remote_data_source.dart';

import 'package:slidee_app/features/auth/login_screen/domain/entities/login_entity.dart';

import '../../domain/repositories/login_respository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImpl(this.loginRemoteDataSource);

  @override
  Future<Either<Faliures, LoginEntity>> login(String email, String password) async{
    var either = await loginRemoteDataSource.login(email, password);
    return either.fold((error) => Left(error) , (response) => Right(response));
  }
}