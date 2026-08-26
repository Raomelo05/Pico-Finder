
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pico_finder/features/auth/data/models/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final http.Client client;

  final FlutterSecureStorage secureStorage;

  AuthRepository(
    this.client,
    this.secureStorage,
    );

  Future<AuthUser> login({
    required String username,
    required String password,
}) async {
final response = await client.post(
  Uri.parse('https://dummyjson.com/auth/login'),
  headers: {
    'Content-type' : 'application/json',
  },
  body: jsonEncode({
    'username': username,
    'password': password,
     
   }),
);


if(response.statusCode != 200){
  throw Exception('Usuário ou senha incorretos');
}

final data = jsonDecode(response.body);

final user = AuthUser.fromJson(data);

await saveSession(user);

return user;

  }

  Future <void> saveSession(AuthUser user) async {
    await secureStorage.write(
      key: 'accessToken',
      value: user.accessToken,
    );

    await secureStorage.write(
      key: 'refreshToken', 
      value: user.refreshToken
    );

    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setString('username', user.username);
  }

  Future<String?> getAccessToken() async {
    final token = await secureStorage.read(
      key: 'accessToken',
      );
    
      return token;      

  }

  Future<void> clearSession() async {
    await secureStorage.deleteAll();

  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
  }

  Future<AuthUser> getCurrentUser(String token) async {
     final response = await client.get(
      Uri.parse('https://dummyjson.com/auth/me'),
      headers: {
        'Authorization' : 'Bearer $token',
      },
    );
  
  if (response.statusCode != 200) {
    throw Exception('Sessão inválida');
  }
  final data = jsonDecode(response.body);

  return AuthUser.fromJson(data);
  
  }

 

}