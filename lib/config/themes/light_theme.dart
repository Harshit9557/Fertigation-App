import 'package:fertigation/app/app.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  dividerColor: ThemeConfig.dividerColorLight,
  appBarTheme: AppBarTheme(
    elevation: 3,
    centerTitle: false,
    titleSpacing: 5.w,
    titleTextStyle: ThemeData.light().textTheme.displayLarge!.copyWith(
          fontFamily: ThemeConfig.pangramRegular,
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
    toolbarTextStyle: ThemeData.light().textTheme.displayMedium!.copyWith(
          fontFamily: ThemeConfig.pangramRegular,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.white,
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
        secondary: const Color(0xffa1a1a1),
        primary: const Color(0xff0F0425),
        onPrimary: const Color(0xff9694B8),
        outline: const Color(0xfff0f0f0),
        onSurface: const Color(0xfff6f8f8),
        surface: const Color(0xffDCE8E8),
        primaryContainer: Colors.white,
        onPrimaryContainer: const Color(0xffd8d8da),
      ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: Color(0xffECEAEA),
    color: ThemeConfig.primaryColor,
  ),
  primaryColor: ThemeConfig.primaryColor,
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) => Colors.black.withOpacity(.4),
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: GoogleFonts.roboto(color: Colors.black),
        titleSmall: GoogleFonts.roboto(
          color: Colors.black.withOpacity(.5),
        ),
        displayLarge: GoogleFonts.roboto(
          color: Colors.black,
        ),
        displayMedium: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.roboto(
          color: ThemeConfig.textColor6B698E,
        ),
        displaySmall: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.roboto(
          color: ThemeConfig.textColorBCBFC2,
        ),
      ),
);
