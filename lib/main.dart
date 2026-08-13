import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pico_finder/providers/pico_provider.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PicoProvider(
        PicoRepository(),
      ),

      child: const MyApp(),
    ),
    );
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


     
