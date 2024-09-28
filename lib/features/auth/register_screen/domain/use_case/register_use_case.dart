import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slidee_app/features/auth/register_screen/domain/repositories/register_repository.dart';

import '../../../../../core/errors/faliures.dart';
import '../entities/register_user_entity.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository ;
  RegisterUseCase({required this.registerRepository});

  Future<Either <Faliures , RegisterUserEntity>> call(String email , String password , String confirmPassword,  String name) async {
    return await registerRepository.createAccount(email, password , name);
  }
}