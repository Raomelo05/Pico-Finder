import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PicoRepository {
  Future<List<Pico>> getPicos() async {
   
   final response = await http.get
   (Uri.parse('https://6a7c6eada008c10e4cbf6768.mockapi.io/pico/api/v1/Picos')
   
   );

   if (response.statusCode != 200) {
      throw Exception('Failed to load picos');
    }
   
   final List<dynamic> data = jsonDecode(response.body);
   
   final pico = data 
   .map((json) => Pico.fromJson(json))
   .toList();
  
    return pico;
  }

  Future<void> savePicos(List<Pico> picos) async{
    final prefs = await SharedPreferences.getInstance();


    final jsonList = picos
         .map((pico) => pico.toJson())
         .toList();


    final jsonString = jsonEncode(jsonList);

    await prefs.setString('picos', jsonString);
  
  }

  Future<List<Pico>> loadPicos() async {
  
     final prefs = await SharedPreferences.getInstance();

     final jsonString = prefs.getString('picos');

     if (jsonString == null) {
        return[];
     }

     final List data = jsonDecode(jsonString);

     final picos = data
          .map((json)  => Pico.fromJson(json))
          .toList();

     return picos;
  }
}