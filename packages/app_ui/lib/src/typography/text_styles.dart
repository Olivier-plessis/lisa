import 'package:app_ui/src/theme/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
*  Main theme typography
*
*/

class StyleTheme {
  StyleTheme._();

  static const TextStyle _baseLargeTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.mainFont,
    color: ColorTheme.secondaryColor,
    fontWeight: FontWeightTheme.regular,
  );

  static const TextStyle _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.secondaryFont,
    color: ColorTheme.greyColor,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get headline1 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleVeryLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headline2 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get headline3 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleMedium.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headline4 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get headline5 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLight.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  /// Default Text Style
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get overLine {
    return _baseTextStyle.copyWith(
        fontSize: FontSizeTheme.bodyMedium.sp,
        fontWeight: FontWeightTheme.regular,
        decoration: TextDecoration.underline,
        color: ColorTheme.secondaryColor);
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }
}

/*
*  Dark theme typography
*
*/

class DarkStyleTheme {
  DarkStyleTheme._();

  static const TextStyle _baseLargeTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.mainFont,
    color: ColorTheme.mainLightColor,
    fontWeight: FontWeightTheme.regular,
  );

  static const TextStyle _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.secondaryFont,
    color: ColorTheme.greyColor,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get headline1 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleVeryLarge.sp,
      fontWeight: FontWeightTheme.medium,
      color: ColorTheme.veryGreyLightColor,
    );
  }

  static TextStyle get headline2 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get headline3 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleMedium.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headline4 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get headline5 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLight.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  /// Default Text Style
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get overLine {
    return _baseTextStyle.copyWith(
        fontSize: FontSizeTheme.bodyMedium.sp,
        fontWeight: FontWeightTheme.regular,
        decoration: TextDecoration.underline,
        color: ColorTheme.secondaryColor);
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }
}

final TextTheme textTheme = TextTheme(
  displayLarge: StyleTheme.headline1,
  displayMedium: StyleTheme.headline2,
  displaySmall: StyleTheme.headline3,
  headlineMedium: StyleTheme.headline4,
  headlineSmall: StyleTheme.headline5,
  titleMedium: StyleTheme.subtitle1,
  titleSmall: StyleTheme.subtitle2,
  bodyLarge: StyleTheme.bodyText1,
  bodyMedium: StyleTheme.bodyText2,
  labelLarge: StyleTheme.button,
  labelSmall: StyleTheme.overLine,
);

final TextTheme darkTextTheme = TextTheme(
  displayLarge: DarkStyleTheme.headline1,
  displayMedium: DarkStyleTheme.headline2,
  displaySmall: DarkStyleTheme.headline3,
  headlineMedium: DarkStyleTheme.headline4,
  headlineSmall: DarkStyleTheme.headline5,
  titleMedium: DarkStyleTheme.subtitle1,
  titleSmall: DarkStyleTheme.subtitle2,
  bodyLarge: DarkStyleTheme.bodyText1,
  bodyMedium: DarkStyleTheme.bodyText2,
  labelLarge: DarkStyleTheme.button,
  labelSmall: DarkStyleTheme.overLine,
);
