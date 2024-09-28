
import 'package:dartz/dartz.dart';
import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/register_screen/domain/entities/register_user_entity.dart';

abstract class RegisterRepository {
  Future<Either <Faliures , RegisterUserEntity>> createAccount(String email , String password, String name );
}