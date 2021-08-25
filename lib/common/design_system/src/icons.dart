import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class _DSIconNames {
  // SVG
  static const BRAND_LOGO = 'assets/svg/brand_logo.svg';
  static const WELCOME_BOTTOM_ICON = 'assets/svg/welcome_bottom_icon.svg';
  static const EYE_ICON = 'assets/svg/eye_icon.svg';
  static const HOME_ICON = 'assets/svg/home_icon.svg';
  static const HIRES_ICON = 'assets/svg/hires_icon.svg';
  static const BELL_ICON = 'assets/svg/bell_icon.svg';
  static const SEARCH_ICON = 'assets/svg/search_icon.svg';
  static const ARROW_RIGTH_ICON = 'assets/svg/arrow_right_icon.svg';
  static const BACK_ICON = 'assets/svg/back_icon.svg';
  static const ADJUSTMENTS_ICON = 'assets/svg/adjustments_icon.svg';

  // PNG
  static const WELCOME_ICON = 'assets/png/welcome_icon.png';
  static const LOGIN_SCREEN_ICON = 'assets/png/login_screen_icon.png';
}

class DSIcons {
  // SVG
  static Widget adjustmentsIcon =
      SvgPicture.asset(_DSIconNames.ADJUSTMENTS_ICON);
  static Widget searchIcon = SvgPicture.asset(_DSIconNames.SEARCH_ICON);
  static Widget bellIcon = SvgPicture.asset(_DSIconNames.BELL_ICON);
  static Widget arrowRightIcon =
      SvgPicture.asset(_DSIconNames.ARROW_RIGTH_ICON);
  static Widget backIcon = SvgPicture.asset(_DSIconNames.BACK_ICON);

  static Widget brandLogo = SvgPicture.asset(_DSIconNames.BRAND_LOGO);
  static Widget welcomeBottomIcon =
      SvgPicture.asset(_DSIconNames.WELCOME_BOTTOM_ICON);
  static Widget eyeIcon = SvgPicture.asset(_DSIconNames.EYE_ICON);
  static Widget homeIcon(Color color) => SvgPicture.asset(
        _DSIconNames.HOME_ICON,
        color: color,
      );
  static Widget hiresIcon(Color color) => SvgPicture.asset(
        _DSIconNames.HIRES_ICON,
        color: color,
      );

  // PNG
  static Widget welcomeIcon = Image.asset(_DSIconNames.WELCOME_ICON);
  static Widget loginScreenIcon = Image.asset(_DSIconNames.LOGIN_SCREEN_ICON);
}
