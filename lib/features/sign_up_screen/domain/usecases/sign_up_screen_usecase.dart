import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/common/services/session_service.dart';
import 'package:car_rental_app/domain/api/sign_up_api.dart';
import 'package:car_rental_app/domain/models/user_model.dart';

class SignUpUsecase {
  SignUpAPI? get _api => Dependencies.resolve();
  GlobalRouter? get _router => Dependencies.resolve();
  SessionService? get _session => Dependencies.resolve();

  void signUp({
    required String email,
    required String fullName,
    required String password,
    required String phone,
  }) async {
    final result = await _api?.signUp(UserModel.signUp(
        name: fullName, password: password, email: email, phone: phone));
    result?.onSuccess((value) {
      _session?.currentUser = value;
      _router?.pushNamedAndRemoveUntil(
          NamedRoutes.DASHBOARD_SCREEN, (route) => false);
    }).catchError((exception) {
      _router?.showSnack(exception.toString());
    });
  }
}
