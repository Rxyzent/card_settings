import 'dart:ui';

import 'package:card_settings/domain/model/colors/theme_colors.dart';
import 'package:injectable/injectable.dart';
import 'static_colors.dart';

@singleton
class DarkThemeColors extends ThemeColors{
  @override
  Color get primary => StaticColors.tePapaGreen;

  @override
  Color get disable => StaticColors.tePapaGreen.withOpacity(0.15);

  @override
  Color get error => StaticColors.error;

  @override
  Color get onPrimary => StaticColors.cuttySark;

  @override
  Color get black => StaticColors.black;

  @override
  Color get white => StaticColors.white;

  @override
  Color get window => StaticColors.solitude;

  @override
  Color get label => StaticColors.suvaGrey;

  @override
  Color get title => StaticColors.black;

  @override
  Color get headline => StaticColors.whiteLilac;

  @override
  Color get color1 => StaticColors.tePapaGreen;

  @override
  Color get color2 => StaticColors.white;

  @override
  Color get color3 => StaticColors.coldMorning;

  @override
  Color get color4 => StaticColors.white;

  @override
  Color get color5 => StaticColors.cuttySark;

  @override
  Color get color6 => StaticColors.pear;

  @override
  Color get color7 => StaticColors.cyprus;
}
