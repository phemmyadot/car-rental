import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/common/design_system/src/colors.dart';
import 'package:car_rental_app/common/design_system/src/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dimentions.dart';

class DSInputField extends StatefulWidget {
  final String? Function(String?) validate;
  final ValueChanged<String>? onChanged;
  final bool isSecureText;
  final bool isLast;
  final TextInputType type;
  final String label;
  final bool showLabel;

  const DSInputField({
    Key? key,
    required this.validate,
    required this.label,
    this.isSecureText = false,
    this.isLast = false,
    this.showLabel = true,
    this.type = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  _DSInputFieldState createState() => _DSInputFieldState(isSecureText);
}

class _DSInputFieldState extends State<DSInputField> {
  final controller = TextEditingController();
  final textFieldKey = GlobalKey();
  String? errorMessage;
  bool isSecure;
  _DSInputFieldState(this.isSecure);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showLabel)
              Text(
                widget.label,
                style: DSTextStyles.poppins.copyWith(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 14.relative,
                ),
                textAlign: TextAlign.start,
              ),
            Container(
              height: 60.relative,
              decoration: BoxDecoration(
                  color: DSColors.BACKGROUND,
                  border: errorMessage != null
                      ? Border.all(color: DSColors.RED_600)
                      : null,
                  borderRadius: BorderRadius.circular(10.relative)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.relative),
                  child: _field,
                ),
              ),
            ),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: DSTextStyles.poppins.copyWith(
                  fontSize: 14.relative,
                  color: DSColors.RED_600,
                ),
              )
          ],
        ),
        if (widget.isSecureText)
          Padding(
            padding:
                EdgeInsets.only(top: errorMessage == null ? 20.relative : 0),
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 60.relative,
                  width: 60.relative,
                  child: Center(
                    child: DSIcons.eyeIcon,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                }),
          ),
      ],
    );
  }

  TextFormField get _field => TextFormField(
        key: textFieldKey,
        decoration: _decoration,
        controller: controller,
        obscureText: isSecure,
        keyboardType: widget.type,
        onChanged: (text) {
          widget.onChanged?.call(text);
          if (errorMessage != null && mounted)
            setState(() {
              errorMessage = widget.validate(text);
            });
        },
        onEditingComplete: () {
          final focus = FocusScope.of(context);
          widget.isLast ? focus.unfocus() : focus.nextFocus();
        },
        validator: (str) {
          if (mounted)
            setState(() {
              errorMessage = widget.validate(str);
            });
          return null;
        },
        style: DSTextStyles.poppins.copyWith(
          color: DSColors.BRAND_BLACK,
          fontSize: 14.relative,
        ),
      );

  InputDecoration get _decoration => InputDecoration(
      border: InputBorder.none,
      hintText: widget.label,
      hintStyle: DSTextStyles.poppins.copyWith(
        color: DSColors.PLACEHOLDER,
        fontSize: 14.relative,
      ));
}
