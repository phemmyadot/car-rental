import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/common/design_system/design_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RelativeDimentions.designWidth = 414;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalRouter? get _router => Dependencies.resolve();

  @override
  void initState() {
    super.initState();

    Dependencies.setup().then((value) {
      _router?.pushNamedAndRemoveUntil(
          NamedRoutes.WELCOME_SCREEN, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: GlobalRouter.onGenerateRoute,
      navigatorKey: GlobalRouter.navigatorKey,
      initialRoute: NamedRoutes.SPLASH_SCREEN,
    );
  }
}
//C:\SDK\flutter\bin\flutter.bat --android-licenses