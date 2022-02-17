import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: HexColor('333739'),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.white),
      bodyText2: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.black),
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
);
