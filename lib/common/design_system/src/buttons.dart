import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'text_styles.dart';
import 'colors.dart';
import 'dimentions.dart';

class DSPrimaryButton extends StatelessWidget {
  final String title;
  final Function() action;
  const DSPrimaryButton({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: action,
      child: Container(
        height: 60.relative,
        decoration: BoxDecoration(
          color: DSColors.GREEN_600,
          borderRadius: BorderRadius.circular(
            10.relative,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: DSTextStyles.poppins.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17.relative,
              color: DSColors.GREEN_50,
            ),
          ),
        ),
      ),
    );
  }
}

class DSSecondaryButton extends StatelessWidget {
  final String title;
  final Function() action;
  final bool filled;
  const DSSecondaryButton({
    Key? key,
    required this.title,
    required this.action,
    this.filled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: action,
      child: Container(
        height: 54.relative,
        decoration: BoxDecoration(
          color: filled ? DSColors.GREEN_600 : null,
          border: filled
              ? null
              : Border.all(
                  color: DSColors.GREEN_600,
                ),
          borderRadius: BorderRadius.circular(
            10.relative,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: DSTextStyles.poppins.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.relative,
              color: filled ? DSColors.GREEN_50 : DSColors.GREEN_600,
            ),
          ),
        ),
      ),
    );
  }
}
