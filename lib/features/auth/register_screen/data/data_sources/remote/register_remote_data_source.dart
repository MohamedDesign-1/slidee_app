import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/faliures.dart';
import '../../../domain/entities/register_user_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<Either <Faliures , RegisterUserEntity>> createAccount(String email , String password, String name );
}