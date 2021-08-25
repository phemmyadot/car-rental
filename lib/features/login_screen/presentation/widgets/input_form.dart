part of '../pages/login_screen.dart';

class InputForm extends StatelessWidget {
  final LoginScreenCubit cubit;
  final LoginScreenState state;
  GlobalRouter? get _router => Dependencies.resolve<GlobalRouter>();
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
            'Login',
            style: DSTextStyles.gilroy.copyWith(
                fontSize: 30.relative,
                color: DSColors.GREY_700,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 15.relative,
          ),
          Text(
            'Hey! Welcome back!',
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
                  validate: cubit.validateEmail,
                  label: 'Email address',
                  type: TextInputType.emailAddress,
                  onChanged: (text) => cubit.email = text,
                ),
                SizedBox(height: 20.relative),
                DSInputField(
                  validate: cubit.validatePassword,
                  label: 'Password',
                  onChanged: (text) => cubit.password = text,
                  isSecureText: true,
                  isLast: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.relative),
          GestureDetector(
            onTap: () {
              _router?.pushNamed(NamedRoutes.FORGOT_PASSWORD_SCREEN);
            },
            child: Text(
              'Forgot Password?',
              textAlign: TextAlign.end,
              style: DSTextStyles.poppins.copyWith(
                  color: DSColors.GREY_500,
                  fontSize: 14.relative,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20.relative),
          DSPrimaryButton(title: 'Login', action: cubit.login),
          SizedBox(height: 30.relative),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'I Don’t have an account yet! ',
                style: DSTextStyles.poppins.copyWith(
                  fontSize: 14.relative,
                  fontWeight: FontWeight.w500,
                  color: DSColors.BRAND_BLACK,
                ),
                children: [
                  TextSpan(
                      text: 'SignUp',
                      style: DSTextStyles.poppins.copyWith(
                        fontSize: 14.relative,
                        fontWeight: FontWeight.w600,
                        color: DSColors.GREEN_600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _router?.pop();
                        }),
                ]),
          ),
          SizedBox(height: 30.relative),
        ],
      ),
    );
  }
}
