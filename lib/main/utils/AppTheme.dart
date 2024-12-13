import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppColors.dart';

class AppThemeData {
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: appColorPrimary,
    primaryColorDark: appColorPrimary,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: textPrimaryColor),
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    cardTheme: CardTheme(color: Colors.white),
    cardColor: cardLightColor,
    iconTheme: IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: TextTheme(
      // Títulos
      displayLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.bodoniModa().fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold
      ),
      displayMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 28
      ),
      displaySmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 24
      ),

      // Encabezados
      headlineLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.bodoniModa().fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 26
      ),
      headlineSmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 22
      ),

      // Títulos de secciones
      titleLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.bodoniModa().fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600
      ),
      titleMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 20
      ),
      titleSmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 18
      ),

      // Cuerpo de texto
      bodyLarge: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 16
      ),
      bodyMedium: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 14
      ),
      bodySmall: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 12
      ),

      // Etiquetas
      labelLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 18
      ),
      labelMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 16
      ),
      labelSmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 14
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: ColorScheme.light(primary: appColorPrimary).copyWith(error: Colors.red),
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColorDark,
    highlightColor: appBackgroundColorDark,
    appBarTheme: AppBarTheme(
      color: appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    primaryColor: color_primary_black,
    dividerColor: Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: color_primary_black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.openSans().fontFamily,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(titleLarge: primaryTextStyle(color: Colors.white), labelSmall: primaryTextStyle(color: Colors.white)),
    cardTheme: CardTheme(color: cardBackgroundBlackDark),
    cardColor: appSecondaryBackgroundColor,
    iconTheme: IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      // Títulos
      displayLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.bodoniModa().fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.bold
      ),
      displayMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 28
      ),
      displaySmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 24
      ),

      // Encabezados
      headlineLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.bodoniModa().fontFamily,
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 26
      ),
      headlineSmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 22
      ),

      // Títulos de secciones
      titleLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.bodoniModa().fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600
      ),
      titleMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 20
      ),
      titleSmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 18
      ),

      // Cuerpo de texto
      bodyLarge: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 16
      ),
      bodyMedium: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 14
      ),
      bodySmall: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 12
      ),

      // Etiquetas
      labelLarge: TextStyle(
        color: appColorPrimary,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 18
      ),
      labelMedium: TextStyle(
        color: textPrimaryColor,
        fontFamily: GoogleFonts.ysabeau().fontFamily,
        fontSize: 16
      ),
      labelSmall: TextStyle(
        color: textSecondaryColor,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        fontSize: 14
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: ColorScheme.dark(primary: appBackgroundColorDark, onPrimary: cardBackgroundBlackDark).copyWith(secondary: whiteColor).copyWith(error: Color(0xFFCF6676)),
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
    }),
  );
}
