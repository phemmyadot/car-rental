import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/features/forgot_password_screen/presentation/cubit/forgot_password_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/card.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final cubit = ForgotPasswordScreenCubit();
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<ForgotPasswordScreenCubit, ForgotPasswordScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: DSColors.GREEN_600,
            body: Center(
              child: ForgotPasswordCard(
                cubit: cubit,
                state: state,
              ),
            ),
          );
        },
      ),
    );
  }
}
