import 'package:flutter/material.dart';

ThemeData lightThemeData() => ThemeData.light()
    .copyWith(
      textTheme: Typography.material2021().black,
      colorScheme: ColorScheme.light(
        primary: materialWhite,
        onPrimary: Colors.grey.shade900,
      ),
    )
    .copyWith(
      scaffoldBackgroundColor: materialWhite,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
      ),
      expansionTileTheme: const ExpansionTileThemeData().copyWith(
        iconColor: Colors.blue,
        textColor: Colors.blue,
      ),
      chipTheme: const ChipThemeData().copyWith(
        backgroundColor: Colors.blue.shade100,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blue.shade100),
        ),
      ),
    );

ThemeData darkThemeData() => ThemeData.dark()
    .copyWith(
        textTheme: Typography.material2021().white,
        colorScheme: ColorScheme.dark(
          primary: Colors.amber.shade600,
        ))
    .copyWith(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.lightBlue.shade400,
      ),
      chipTheme: const ChipThemeData().copyWith(
        backgroundColor: Colors.blue,
        labelStyle: TextStyle(color: Colors.grey.shade900),
      ),
      switchTheme: const SwitchThemeData().copyWith(
        thumbColor: MaterialStateProperty.all<Color>(Colors.blue),
        trackColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
      ),
    );

const MaterialColor materialWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
