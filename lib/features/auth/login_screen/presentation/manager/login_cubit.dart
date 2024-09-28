import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/login_screen/domain/entities/login_entity.dart';
import 'package:slidee_app/features/auth/login_screen/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  var emailController = TextEditingController(text: 'LZkKz@example.com');
  var passwordController = TextEditingController(text: '12345678');
  var formKey = GlobalKey<FormState>();

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await loginUseCase.call(email, password);
    result.fold(
      (failure) {
        emit(LoginError(failure));
      },
      (loginEntity) {
        emit(LoginSuccess(loginEntity));
      },
    );
  }

  onPressedLogin() {
    if (formKey.currentState!.validate()) {
      login(emailController.text, passwordController.text);
    }
  }
}
