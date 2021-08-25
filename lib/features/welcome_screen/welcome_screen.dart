import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  GlobalRouter? get _router => Dependencies.resolve();
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DSIcons.welcomeBottomIcon,
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.relative),
                child: Center(child: DSIcons.welcomeIcon),
              )
            ],
          ),
          Center(
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _body() => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Welcome',
                style: DSTextStyles.gilroy.copyWith(
                  fontSize: 36.relative,
                  color: DSColors.GREY_800,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 15.relative,
            ),
            Text(
              'Rent your Dream, Enjoy your Drive!',
              style: DSTextStyles.poppins.copyWith(
                fontSize: 16.relative,
                fontWeight: FontWeight.w400,
                color: DSColors.GREY_700,
              ),
            ),
            SizedBox(
              height: 30.relative,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.relative),
              child: DSPrimaryButton(
                action: () {
                  _router?.pushNamed(NamedRoutes.SIGN_UP_SCREEN);
                },
                title: 'Next',
              ),
            ),
          ],
        ),
      );
}
