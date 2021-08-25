import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign_up_screen_cubit.dart';

part '../widgets/input_form.dart';

class SignUpScreen extends StatelessWidget {
  final cubit = SignUpScreenCubit();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<SignUpScreenCubit, SignUpScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: DSColors.BACKGROUND,
            body: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150.relative,
                    child: Center(
                      child: DSIcons.brandLogo,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: InputForm(
                        cubit: cubit,
                        state: state,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.relative),
                          right: Radius.circular(30.relative),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
