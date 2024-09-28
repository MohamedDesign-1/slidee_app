import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:slidee_app/core/errors/faliures.dart';

import 'package:slidee_app/features/auth/register_screen/domain/entities/register_user_entity.dart';

import '../../../models/register_response_dto.dart';
import '../register_remote_data_source.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {

  @override
  Future<Either<Faliures, RegisterUserEntity>> createAccount(String email, String password , String name) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = credential.user!.uid;

      RegisterResponseDto userDto = RegisterResponseDto(
        uId: userId,
        name: name,
        email: email,
      );

      await FirebaseFirestore.instance.collection('users').doc(userId).set(userDto.toJson());

      return Right(userDto);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Faliures(errorMessage: 'The password provided is too weak.', ));
      } else if (e.code == 'email-already-in-use') {
        return Left(Faliures(errorMessage: 'The account already exists for that email.'));
      } else {
        return Left(Faliures(errorMessage: e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      return Left(Faliures(errorMessage: e.toString()));
    }  }

}