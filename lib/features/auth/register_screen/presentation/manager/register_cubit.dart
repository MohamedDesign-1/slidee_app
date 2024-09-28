import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:slidee_app/features/auth/register_screen/domain/entities/register_user_entity.dart';
import 'package:slidee_app/features/auth/register_screen/domain/use_case/register_use_case.dart';

import '../../../../../core/errors/faliures.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  var nameController = TextEditingController(text: 'MohamedMahmoud');
  var emailController = TextEditingController(text: 'LZkKz@example.com');
  var phoneController = TextEditingController(text: '01000000000');
  var passwordController = TextEditingController(text: '12345678');
  var confirmPasswordController = TextEditingController(text: '12345678');
  var formKey = GlobalKey<FormState>();


  void register() async {
    print('Registering...');
    emit(RegisterLoading());
    final result = await registerUseCase.call(
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        nameController.text,
    );
    result.fold(
            (failure) {
              print('Registration failed: ${failure.errorMessage}');
              emit(RegisterError(failure));
            },
            (authUserEntity) {
              print('Registration success: $authUserEntity');
              emit(RegisterSuccess(authUserEntity));
            }
    );
  }
  void onRegisterButtonPressed() {
    if (formKey.currentState!.validate()) {
      register();
    } else {
      emit(RegisterError(ServerFaliure(errorMessage: 'Please enter valid data')));
    }
  }
}
