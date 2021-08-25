import 'dart:developer';

import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/common/services/firebase%20_helper.dart';
import 'package:car_rental_app/common/services/session_service.dart';
import 'package:car_rental_app/common/services/validation_service.dart';
import 'package:car_rental_app/domain/api/login_api.dart';
import 'package:car_rental_app/domain/api/sign_up_api.dart';
import 'package:car_rental_app/domain/api/vehicle_api.dart';
import 'package:car_rental_app/features/dashboard/features/hires_page/domain/usecases/hires_page_usecases.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/domain/usecases/home_page_usecases.dart';
import 'package:car_rental_app/features/dashboard/features/vehicle_details/domain/usecases/vehicle_details_usecases.dart';
import 'package:car_rental_app/features/login_screen/domain/usecases/login_screen_usecases.dart';
import 'package:car_rental_app/features/sign_up_screen/domain/usecases/sign_up_screen_usecase.dart';

import 'package:get_it/get_it.dart';

class Dependencies {
  static final _getIt = GetIt.instance;
  static T? resolve<T extends Object>() {
    if (_getIt.isRegistered<T>()) return _getIt.get<T>();

    log('Oops!!! Looks like you forgot to register: $T');
    return null;
  }

  static Future<void> setup() async {
    final helper = await FirebaseHelper.initialize();
    _getIt.registerSingleton(helper);
    _getIt.registerSingleton(HiresUsecase());
    _getIt.registerSingleton(VehicleDetailsUsecase());
    _getIt.registerSingleton(HomePageUsecase());
    _getIt.registerSingleton(SessionService());
    _getIt.registerSingleton(VehicleAPI());
    _getIt.registerSingleton(GlobalRouter());
    _getIt.registerSingleton(ValidationService());
    _getIt.registerSingleton(SignUpAPI());
    _getIt.registerSingleton(SignUpUsecase());
    _getIt.registerSingleton(LoginAPI());
    _getIt.registerSingleton(LoginUsecase());

    await Future.delayed(Duration(seconds: 2));
  }
}
