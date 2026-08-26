import 'package:flutter/foundation.dart';

import 'package:pico_finder/features/auth/data/models/auth_user.dart';
import 'package:pico_finder/features/auth/data/repositories/auth_repository.dart';

class AuthProvider  extends ChangeNotifier {
    final AuthRepository authRepository;

    AuthProvider(this.authRepository);

    AuthUser ? user;

    bool isloading = false;

    String? error;

    bool get isAuthenticated => user !=null;

    bool isCheckingSession = true;

    int _authOperation = 0;


    Future <void> login({
    required String username,
    required String password,
     }) async {
     ++_authOperation;
    
      isloading = true;
      error = null;
      notifyListeners();
    
     try {  
      final result = await authRepository.login(
      username: username, 
      password: password,
       );
  
    user = result;
    } catch(e){
      error = e.toString();
    }finally{
      isloading = false;
      notifyListeners();
    }
   }

   Future<void> checkSession() async {
   final operation = ++_authOperation;

  try {
    final token = await authRepository.getAccessToken();

    if (token == null || token.isEmpty) {
      return;
    }

    final currentUser = await authRepository.getCurrentUser(token);

    if (operation != _authOperation) {
      return;
    }

    user = currentUser;
  } catch (e) {
    if (operation != _authOperation) {
      return;
    }

    await authRepository.clearSession();
    user = null;
  } finally {
    if (operation == _authOperation) {
      isCheckingSession = false;
      notifyListeners();
    }
  }
   
   }

    Future <void> logout() async {
    ++_authOperation;

  await authRepository.clearSession();

  user = null;
  isCheckingSession = false;

  notifyListeners();
  }

  }