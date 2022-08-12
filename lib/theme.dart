  import 'package:flutter/material.dart';


      MaterialColor PrimaryMaterialColor = MaterialColor(
      4289387058,
      <int, Color>{
        50: Color.fromRGBO(
          170,
          218,
          50,
          .1,
        ),
        100: Color.fromRGBO(
          170,
          218,
          50,
          .2,
        ),
        200: Color.fromRGBO(
          170,
          218,
          50,
          .3,
        ),
        300: Color.fromRGBO(
          170,
          218,
          50,
          .4,
        ),
        400: Color.fromRGBO(
          170,
          218,
          50,
          .5,
        ),
        500: Color.fromRGBO(
          170,
          218,
          50,
          .6,
        ),
        600: Color.fromRGBO(
          170,
          218,
          50,
          .7,
        ),
        700: Color.fromRGBO(
          170,
          218,
          50,
          .8,
        ),
        800: Color.fromRGBO(
          170,
          218,
          50,
          .9,
        ),
        900: Color.fromRGBO(
          170,
          218,
          50,
          1,
        ),
      },
    );

    ThemeData myTheme = ThemeData(
      fontFamily: "customFont",
      primaryColor: Color(0xffaada32),
      buttonColor: Color(0xffaada32),
      accentColor: Color(0xffaada32),

      primarySwatch: PrimaryMaterialColor,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xffaada32),
          ),
        ),
      ),
    );
  