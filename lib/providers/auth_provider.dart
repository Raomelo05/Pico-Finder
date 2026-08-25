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


    Future <void> login({
    required String username,
    required String password,

    }) async {
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
   try {
    final token = await authRepository.getAccessToken();

    

    if (token == null || token.isEmpty) {
      return;
    }
    final currentUser = await authRepository.getCurrentUser(token);

        
   user = currentUser;
   } catch (e){
      
      await authRepository.clearSession();
    user = null;
   }finally{
    isCheckingSession = false;
       notifyListeners();

   }
   
   }

    Future <void> logout() async {
    await authRepository.clearSession();

    user = null;

    notifyListeners();
  }

  }