part of '../pages/forgot_password_screen.dart';

class ForgotPasswordCard extends StatelessWidget {
  final ForgotPasswordScreenCubit cubit;
  final ForgotPasswordScreenState state;
  GlobalRouter? get _router => Dependencies.resolve<GlobalRouter>();
  const ForgotPasswordCard({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.relative),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              60.relative,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.relative),
          child: state is ForgotPasswordScreenInitial
              ? initialWidget()
              : Container(
                  height: 400.relative,
                  child: Center(
                    child: sentWidget(),
                  ),
                ),
        ),
      ),
    );
  }

  Widget sentWidget() => Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 25.relative,
        ),
        Center(
          child: Container(
            child: Center(
              child: Icon(
                Icons.done,
                size: 50,
                color: DSColors.GREEN_50,
              ),
            ),
            width: 100.relative,
            height: 100.relative,
            decoration: BoxDecoration(
                color: DSColors.GREEN_600,
                borderRadius: BorderRadius.circular(50.relative)),
          ),
        ),
        SizedBox(
          height: 35.relative,
        ),
        Center(
          child: Text(
            'Password Reset Successful',
            style: DSTextStyles.poppins.copyWith(
              fontSize: 18.relative,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 20.relative,
        ),
        Center(
          child: Text(
            'Check your mailbox or Spam / Junk files for a link to reset password ',
            textAlign: TextAlign.center,
            style: DSTextStyles.poppins.copyWith(
              fontSize: 16.relative,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 30.relative,
        ),
        DSSecondaryButton(
          title: 'Goto Login',
          action: () {
            _router?.pop();
          },
        ),
        SizedBox(
          height: 30.relative,
        )
      ]);

  ListView initialWidget() {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 35.relative,
            ),
            Center(
              child: Text(
                'Forgot your password?',
                style: DSTextStyles.poppins.copyWith(
                  fontSize: 18.relative,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.relative,
            ),
            Center(
              child: Text(
                'Don’t worry! resetting your password is easy. Just type in the email address you registered with to recieve a link to reset your password.',
                textAlign: TextAlign.center,
                style: DSTextStyles.poppins.copyWith(
                  fontSize: 16.relative,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30.relative,
            ),
            DSInputField(
              validate: (_) => null,
              label: 'Enter your email address',
              showLabel: false,
              isLast: true,
            ),
            SizedBox(
              height: 30.relative,
            ),
            DSSecondaryButton(
              title: 'Send',
              action: cubit.send,
              filled: true,
            ),
            SizedBox(
              height: 30.relative,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Remember password? ',
                  style: DSTextStyles.poppins.copyWith(
                    fontSize: 14.relative,
                    fontWeight: FontWeight.w500,
                    color: DSColors.BRAND_BLACK,
                  ),
                  children: [
                    TextSpan(
                        text: 'Try logging in',
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
            SizedBox(
              height: 60.relative,
            ),
          ],
        )
      ],
    );
  }
}
