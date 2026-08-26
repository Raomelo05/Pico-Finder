import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pico_finder/home/presentation/homepage.dart';
import 'package:pico_finder/providers/auth_provider.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pico_finder/providers/pico_provider.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';
import 'package:pico_finder/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorage = const FlutterSecureStorage();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PicoProvider(
            PicoRepository(
              http.Client(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            AuthRepository(
              http.Client(),
              secureStorage,
            ),
          ),
        ),
      ],
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
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState(){
    super.initState();

    Future.microtask(() {
     context.read<AuthProvider>().checkSession();
    });
  }

  @override 
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
 


   if(authProvider.isCheckingSession) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
   }
   
    if(authProvider.isAuthenticated) {
      return const Homepage();
    }

    return const LoginPage();
  }
}

     
