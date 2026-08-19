import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockHttpClient extends Mock implements http.Client{}

void main() {
late MockHttpClient mockClient;
late PicoRepository repository;

setUpAll((){
registerFallbackValue(Uri());
});

setUp(() async {
     SharedPreferences.setMockInitialValues({});

mockClient = MockHttpClient();
repository = PicoRepository(mockClient);
});

test('deve buscar os picos da API', () async {
   final response = http.Response(
    '''
    [
      {
      
      "imageUrl" : "imagem.jpg",
      "name" : "Pico Central",
      "type" : "Street",
      "rating" : 4.5,
      "location" : "Recife",
      "level" : "intermediate",
      "description" : "Pico para skate"
      
      }
    ]
      ''',
    200,
   );
   
   when(
  () => mockClient.get(any()),
).thenAnswer(
  (_) async => response,
  );

  final picos = await repository.getPicos();

  expect(picos.length, 1);
  expect(picos.first.name, 'Pico Central');
  expect(picos.first.location, 'Recife');

});

test('deve salvar os picos localmente', () async {
  
  const pico = Pico(
    imageUrl: 'imagem.jpg', 
    name: 'Pico Central', 
    type: 'Street', 
    rating: 4.5, 
    location: 'Recife', 
    level: 'intermediate', 
    description: 'Pico para skate'
    );

    await repository.savePicos([pico]);

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('picos');

    expect(jsonString, isNotNull);
});

test('deve carregar os picos salvos localmente', () async{
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.setString(
    'picos',
     '''
    [
      {
      
      "imageUrl" : "imagem.jpg",
      "name" : "Pico Central",
      "type" : "Street",
      "rating" : 4.5,
      "location" : "Recife",
      "level" : "intermediate",
      "description" : "Pico para skate"
      
      }
    ]
      ''',
   );

   final picos = await repository.loadPicos();

  expect(picos.length, 1);
  expect(picos.first.name, 'Pico Central');
  expect(picos.first.location, 'Recife');
});

}
