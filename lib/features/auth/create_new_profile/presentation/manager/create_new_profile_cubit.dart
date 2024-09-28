import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:slidee_app/features/auth/create_new_profile/domain/use_cases/create_new_profile_use_case.dart';

import '../../../../../core/components/validators.dart';
import '../../../../../core/errors/faliures.dart';
import '../../domain/entities/profile_entity.dart';

part 'create_new_profile_state.dart';

@injectable
class CreateNewProfileCubit extends Cubit<CreateNewProfileState> {
  final CreateNewProfileUseCase createNewProfileUseCase;
  CreateNewProfileCubit({required this.createNewProfileUseCase}) : super(CreateNewProfileInitial());

  final usernameController = TextEditingController(text: 'MohamedMahmoud');
  final displayNameController = TextEditingController(text: 'LZkKz@example.com');
  final bioController = TextEditingController(text: '01000000000');
  final formKey = GlobalKey<FormState>();

  Future<void> createNewProfile(String imageUrl) async {
    emit(CreateNewProfileLoading());
    final result = await createNewProfileUseCase.call(
      usernameController.text,
      displayNameController.text,
      bioController.text,
      imageUrl,
    );

    result.fold(
          (error) => emit(CreateNewProfileError(error)),
          (response) => emit(CreateNewProfileSuccess(response)),
    );
  }

  Future<String?> pickImageAndUpload() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        return await uploadImageToStorage(image);
      } else {
        emit(UploadImageError(Faliures(errorMessage: 'No image selected')));
        return null;
      }
    } catch (e) {
      emit(UploadImageError(Faliures(errorMessage: e.toString())));
      return null;
    }
  }

  Future<String> uploadImageToStorage(XFile image) async {
    final storageRef = FirebaseStorage.instance.ref().child('profile_images/${image.name}');
    await storageRef.putFile(File(image.path));
    return await storageRef.getDownloadURL();
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    displayNameController.dispose();
    bioController.dispose();
    return super.close();
  }

  onPressedCreateProfile(String imageUrl) async {
    if (formKey.currentState!.validate()) {
      try {
        bool isUnique = await AppValidators.isUsernameUnique(usernameController.text);
        if (!isUnique) {
          emit(CreateNewProfileError(Faliures(errorMessage: 'Username is already taken')));
        } else {
          createNewProfile(imageUrl);
        }
      } catch (e) {
        emit(CreateNewProfileError(Faliures(errorMessage: 'Failed to verify username uniqueness')));
      }
    } else {
      emit(CreateNewProfileError(Faliures(errorMessage: 'Please enter valid data')));
    }
  }

}



