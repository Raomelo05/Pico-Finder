import 'package:flutter/material.dart';
import 'core/constants/theme/routes/services/utils/app_theme.dart';
import 'features/auth/data/domain/presentation/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pico Finder',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}


     
