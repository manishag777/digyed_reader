
import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';

extension CustomTextTheme on TextTheme{
  TextStyle get heading => headline4;
  TextStyle get headingHint => headline3;
  TextStyle get body => headline5;
  TextStyle get bodyHint => headline6;
  TextStyle get other => bodyText1;
}

ThemeData changeTextTheme(ThemeData theme) {
    theme = theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        headline4: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w500, fontSize: 34.0, color: theme.colorScheme.onSurface),
        headline3: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w500, fontSize: 34.0, color: theme.hintColor),
        headline5: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w500, fontSize: 24.0, color: theme.colorScheme.onSurface),
        headline6: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w500, fontSize: 24.0, color: theme.hintColor),
        bodyText1: theme.textTheme.headline3.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0, color: theme.colorScheme.onSurface),

    )
    );
    return theme;
}


Map<ThemeType, ThemeData> get themeDataMap  {

//  ThemeData darkTheme = ThemeData.dark();
//  ThemeData lightTheme = ThemeData.light();

  ThemeData lightTheme = ThemeData.light().copyWith(colorScheme: ColorScheme.light().copyWith(
      primary: Color(0xFFBB86FC),
      primaryVariant: Color(0xFF3700B3),

      secondary: Color(0xFF03DAC6),
      secondaryVariant: Color(0xFF018786),

      background: Color(0xFFF5F5F5),
      surface: Color(0xFFFFFFFF),

      error: Color(0xFFB00020),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF000000),
      onBackground: Color(0xFF000000),
      onSurface: Color(0xFF000000),
      onError: Color(0xFFFFFFFF)
  )).copyWith(hintColor: Colors.grey[600]);
//  lightTheme.copyWith(textTheme: CustomStyles);

  lightTheme = changeTextTheme(lightTheme);
  
//  const Color textColor = Color.fromARGB(255, 255, 255, 255);
//  const TextStyle headingStyle = TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.bold);
//  const TextStyle descriptionStyle = TextStyle(color: textColor, fontSize: 15,);
  

  ThemeData darkTheme = ThemeData.dark().copyWith(colorScheme: ColorScheme.light().copyWith(
      primary: Color(0xFF6200EE),
      primaryVariant: Color(0xFF3700B3),

      secondary: Color(0xFF03DAC6),
      secondaryVariant: Color(0xFF03DAC6),

      background: Color(0xFF12171A),
      surface: Color(0xFF2A2E35),

      error: Color(0xFFCF6679),

      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      onBackground: Color(0xFFFFFFFF),
      onSurface: Color(0xFFFFFFFF),
      onError: Color(0xFF000000)
  )).copyWith(hintColor: Colors.grey[400]);


  darkTheme = changeTextTheme(darkTheme);


  return {ThemeType.Dark: darkTheme, ThemeType.Light: lightTheme};

}