import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/services/validation_service.dart';
import 'package:car_rental_app/features/sign_up_screen/domain/usecases/sign_up_screen_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_screen_state.dart';

class SignUpScreenCubit extends Cubit<SignUpScreenState> {
  String fullName = '';
  String email = '';
  String phone = '';
  String password = '';
  ValidationService? get validationService => Dependencies.resolve();
  SignUpUsecase? get _usecase => Dependencies.resolve();
  SignUpScreenCubit() : super(SignUpScreenStateInitial(GlobalKey<FormState>()));

  String? validateName(String? text) {
    return validationService?.validateName(text);
  }

  String? validateEmail(String? text) {
    return validationService?.validateEmail(text);
  }

  String? validatePhone(String? text) {
    return validationService?.validatePhone(text);
  }

  String? validatePassword(String? text) {
    return validationService?.validatePassword(text);
  }

  void signUp() {
    state.formKey.currentState?.validate();
    final valid = validateName(fullName) == null &&
        validateEmail(email) == null &&
        validatePhone(phone) == null &&
        validatePassword(password) == null;
    if (!valid) return;
    _usecase?.signUp(
        email: email, fullName: fullName, password: password, phone: phone);
  }
}
