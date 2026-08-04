import 'package:flutter/material.dart';
import 'package:pico_finder/core/theme/app_colors.dart';
import 'package:pico_finder/core/theme/app_text_style.dart';



class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.backgroundColor,

   colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor),
   
   elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
),
 inputDecorationTheme: InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide
    (color: AppColors.primaryColor, 
    width: 2.0),
    ),
 ),

  textTheme: const TextTheme(
   headlineSmall: TextStyle(
    fontFamily: 'Roboto', 
    fontSize: 50, 
    fontWeight: FontWeight.bold),

   ),
  textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primaryColor,
    textStyle: AppTextStyles.body,
     
  ),
  ),
    );
    


}
  
