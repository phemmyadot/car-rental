part of 'login_screen_cubit.dart';

abstract class LoginScreenState {
  final GlobalKey<FormState> formKey;

  LoginScreenState(this.formKey);
}

class LoginScreenStateInitial extends LoginScreenState {
  LoginScreenStateInitial(GlobalKey<FormState> formKey) : super(formKey);
}
