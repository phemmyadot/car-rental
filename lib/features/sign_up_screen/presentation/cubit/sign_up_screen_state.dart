part of 'sign_up_screen_cubit.dart';

abstract class SignUpScreenState {
  final GlobalKey<FormState> formKey;

  SignUpScreenState(this.formKey);
}

class SignUpScreenStateInitial extends SignUpScreenState {
  SignUpScreenStateInitial(GlobalKey<FormState> formKey) : super(formKey);
}
