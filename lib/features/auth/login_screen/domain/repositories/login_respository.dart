import 'package:dartz/dartz.dart';
import 'package:slidee_app/features/auth/login_screen/domain/entities/login_entity.dart';

import '../../../../../core/errors/faliures.dart';

abstract class LoginRepository {
  Future<Either<Faliures, LoginEntity>> login(String email, String password);
}