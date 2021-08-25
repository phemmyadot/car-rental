part of '../pages/sign_up_screen.dart';

class InputForm extends StatelessWidget {
  final SignUpScreenCubit cubit;
  final SignUpScreenState state;
  const InputForm({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.relative),
      child: ListView(
        children: [
          SizedBox(height: 40.relative),
          Text(
            'Sign Up',
            style: DSTextStyles.gilroy.copyWith(
                fontSize: 30.relative,
                color: DSColors.GREY_700,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 15.relative,
          ),
          Text(
            'Sign Up to get started',
            style: DSTextStyles.gilroy
                .copyWith(fontSize: 16.relative, color: DSColors.GREY_700),
          ),
          SizedBox(
            height: 40.relative,
          ),
          Form(
            key: state.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DSInputField(
                  validate: cubit.validateName,
                  label: 'Full Name',
                  onChanged: (text) => cubit.fullName = text,
                ),
                SizedBox(height: 20.relative),
                DSInputField(
                  validate: cubit.validateEmail,
                  label: 'Email address',
                  type: TextInputType.emailAddress,
                  onChanged: (text) => cubit.email = text,
                ),
                SizedBox(height: 20.relative),
                DSInputField(
                  validate: cubit.validatePhone,
                  label: 'Phone Number',
                  type: TextInputType.phone,
                  onChanged: (text) => cubit.phone = text,
                ),
                SizedBox(height: 20.relative),
                DSInputField(
                  validate: cubit.validatePassword,
                  label: 'Password',
                  isSecureText: true,
                  onChanged: (text) => cubit.password = text,
                  isLast: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.relative),
          DSPrimaryButton(title: 'Sign Up', action: cubit.signUp),
          SizedBox(height: 30.relative),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'I have an account already, ',
                style: DSTextStyles.poppins.copyWith(
                  fontSize: 14.relative,
                  fontWeight: FontWeight.w500,
                  color: DSColors.BRAND_BLACK,
                ),
                children: [
                  TextSpan(
                      text: 'Login',
                      style: DSTextStyles.poppins.copyWith(
                        fontSize: 14.relative,
                        fontWeight: FontWeight.w600,
                        color: DSColors.GREEN_600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Dependencies.resolve<GlobalRouter>()
                              ?.pushNamed(NamedRoutes.LOGIN_SCREEN);
                        }),
                ]),
          ),
          SizedBox(height: 30.relative),
        ],
      ),
    );
  }
}
