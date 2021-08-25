import 'package:car_rental_app/domain/models/vehicle.dart';
import 'package:car_rental_app/features/dashboard/dashboard_screen.dart';
import 'package:car_rental_app/features/dashboard/features/vehicle_details/presentation/pages/vehicle_details_page.dart';
import 'package:car_rental_app/features/forgot_password_screen/presentation/pages/forgot_password_screen.dart';
import 'package:car_rental_app/features/login_screen/presentation/pages/login_screen.dart';
import 'package:car_rental_app/features/sign_up_screen/presentation/pages/sign_up_screen.dart';
import 'package:car_rental_app/features/splash_screen/splash_screen.dart';
import 'package:car_rental_app/features/welcome_screen/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamedRoutes {
  static const String SPLASH_SCREEN = 'SPLASH_SCREEN';
  static const String WELCOME_SCREEN = 'WELCOME_SCREEN';
  static const String SIGN_UP_SCREEN = 'SIGN_UP_SCREEN';
  static const String LOGIN_SCREEN = 'LOGIN_SCREEN';
  static const String FORGOT_PASSWORD_SCREEN = 'FORGOT_PASSWORD_SCREEN';
  static const String DASHBOARD_SCREEN = 'DASHBOARD_SCREEN';
  static const String VEHICLE_DETAILS_SCREEN = 'VEHICLE_DETAILS_SCREEN';
}

extension _Route on Widget {
  Route<dynamic> route({bool isFullScreenDialog = false}) => CupertinoPageRoute(
      builder: (c) => this, fullscreenDialog: isFullScreenDialog);
}

class GlobalRouter extends NavigatorState {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoutes.SPLASH_SCREEN:
        return SplashScreen().route();
      case NamedRoutes.WELCOME_SCREEN:
        return WelcomeScreen().route(isFullScreenDialog: true);
      case NamedRoutes.LOGIN_SCREEN:
        return LoginScreen().route();
      case NamedRoutes.SIGN_UP_SCREEN:
        return SignUpScreen().route();
      case NamedRoutes.FORGOT_PASSWORD_SCREEN:
        return ForgotPasswordScreen().route();
      case NamedRoutes.DASHBOARD_SCREEN:
        return DashboardScreen().route();
      case NamedRoutes.VEHICLE_DETAILS_SCREEN:
        return VehicleDetailsScreen(
                arguments: settings.arguments as VehicleDetailsScreenArguments)
            .route();
      default:
        return Container().route();
    }
  }

  void showSnack(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String newRouteName, RoutePredicate predicate,
      {Object? arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        newRouteName, predicate,
        arguments: arguments);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }
}
