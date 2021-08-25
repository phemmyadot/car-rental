import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_screen_state.dart';

class ForgotPasswordScreenCubit extends Cubit<ForgotPasswordScreenState> {
  ForgotPasswordScreenCubit() : super(ForgotPasswordScreenInitial());

  void send() {
    emit(ForgotPasswordScreenSent());
  }
}
