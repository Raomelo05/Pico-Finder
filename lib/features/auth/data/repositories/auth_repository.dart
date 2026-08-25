
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pico_finder/features/auth/data/models/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final http.Client client;

  AuthRepository(this.client);

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
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('accessToken', user.accessToken!);
    await prefs.setString('refreshToken', user.refreshToken!);
    await prefs.setString('username', user.username);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('accessToken');
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
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