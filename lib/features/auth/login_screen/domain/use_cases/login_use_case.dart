
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slidee_app/features/auth/login_screen/domain/repositories/login_respository.dart';

import '../../../../../core/errors/faliures.dart';
import '../entities/login_entity.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});

  Future<Either<Faliures, LoginEntity>> call(String email , String password) async {
    return await loginRepository.login(email, password);
  }
}