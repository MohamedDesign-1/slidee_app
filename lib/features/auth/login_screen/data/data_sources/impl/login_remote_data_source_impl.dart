import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/login_screen/data/models/login_model_dto.dart';

import 'package:slidee_app/features/auth/login_screen/domain/entities/login_entity.dart';

import '../login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  @override
  Future<Either<Faliures, LoginModelDto>> login(String email, String password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;

      if (user != null) {
        return Right(LoginModelDto(
          email: email,
          password: password,
        ));
      } else {
        return Left(Faliures(errorMessage: 'User not found.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Faliures(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(Faliures(errorMessage: 'The account already exists for that email.'));
      } else {
        return Left(Faliures(errorMessage: e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      return Left(Faliures(errorMessage: e.toString()));
    }
  }
}