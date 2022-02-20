import 'constants.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _primaryColor = Color(0xFF06d6a0);

  // static const _secondaryColor = Color(0xFFe5e5e5);
  static const _secondaryColor = Color(0xFFffffff);
  // static const _backgroundColor = Color(0xFFe5e5e5);

  // static const _secondaryColorDark = Color(0x121212);
  static const _backgroundColorDark = Colors.black;

  // static const _backgroundColor = Color(0xFFffffff);
  static final _iconTheme = IconThemeData(
    color: Colors.grey[600],
  );
  static final _iconThemedark = IconThemeData(
    color: Colors.grey[600],
  );
  static const _dividerTheme = DividerThemeData(
    space: 0.0,
    indent: 16.0,
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    // this putts te lable in the border
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    // contentPadding: const EdgeInsets.all(0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: primaryColor.withOpacity(0.2)),
      gapPadding: 10,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
      gapPadding: 10,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
      gapPadding: 10,
    ),
  );

  static ThemeData dark() {
    // final textTheme = _getTextTheme(Brightness.dark);
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      dividerTheme: _dividerTheme,
      scaffoldBackgroundColor: _backgroundColorDark,
      // canvasColor: _secondaryColorDark,
      iconTheme: _iconTheme,
      inputDecorationTheme: _inputDecorationTheme,
      // cardColor: _secondaryColorDark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData light() {
    // final textTheme = _getTextTheme(Brightness.light);
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
      brightness: Brightness.light,
      dividerTheme: _dividerTheme,
      iconTheme: _iconThemedark,
      inputDecorationTheme: _inputDecorationTheme,
      cardColor: _secondaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

//   static TextTheme _getTextTheme(Brightness brightness) {
//     final themeData = ThemeData(brightness: brightness);

//     return GoogleFonts.robotoTextTheme(themeData.textTheme).copyWith(
//       headline1: GoogleFonts.roboto(),
//       headline2: GoogleFonts.roboto(),
//       headline3: GoogleFonts.roboto(),
//       headline4: GoogleFonts.roboto(),
//       headline5: GoogleFonts.roboto(),
//       headline6: GoogleFonts.roboto(),
//     );
//   }
}
