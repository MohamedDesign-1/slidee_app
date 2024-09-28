import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faliures.dart';
import '../../domain/entities/login_entity.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Faliures, LoginEntity>> login(String email, String password);
}