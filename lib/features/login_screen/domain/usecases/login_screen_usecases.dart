import 'dart:convert';

import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/common/services/session_service.dart';
import 'package:car_rental_app/domain/api/login_api.dart';

class LoginUsecase {
  LoginAPI? get _api => Dependencies.resolve();
  GlobalRouter? get _router => Dependencies.resolve();
  SessionService? get _session => Dependencies.resolve();

  void login({
    required String email,
    required String password,
  }) async {
    final token = base64.encode(utf8.encode('$email:$password'));
    final result = await _api?.login(token);
    result?.onSuccess((value) {
      _session?.currentUser = value;
      _router?.pushNamedAndRemoveUntil(
          NamedRoutes.DASHBOARD_SCREEN, (route) => false);
    }).catchError((exception) {
      _router?.showSnack(exception.toString());
    });
  }
}
