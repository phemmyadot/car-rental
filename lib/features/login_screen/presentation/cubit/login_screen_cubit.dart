import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/services/validation_service.dart';
import 'package:car_rental_app/features/login_screen/domain/usecases/login_screen_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  String email = '';
  String password = '';
  LoginUsecase? get _usecase => Dependencies.resolve();
  ValidationService? get validationService => Dependencies.resolve();
  LoginScreenCubit() : super(LoginScreenStateInitial(GlobalKey<FormState>()));

  String? validateEmail(String? text) {
    return validationService?.validateEmail(text);
  }

  String? validatePassword(String? text) {
    return validationService?.validatePassword(text);
  }

  void login() {
    state.formKey.currentState?.validate();
    final isValid =
        validateEmail(email) == null && validatePassword(password) == null;
    if (!isValid) return;
    _usecase?.login(email: email, password: password);
  }
}
