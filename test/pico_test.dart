import 'package:flutter_test/flutter_test.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';


void main(){
  test('deve criar um Pico a partir de um JSON',() {
    final Map<String, dynamic> json = {
      
      'imageUrl' : 'imagem.jpg',
      'name' : 'Pico Central',
      'type' : 'Street',
      'rating' : 4.5,
      'location' : 'Recife',
      'level': 'Intermediate',
      'description' : 'Pico para skate',
    };
    
    final pico = Pico.fromJson(json);

    expect(pico.name, 'Pico Central');
    expect(pico.rating, 4.5);
    expect(pico.location, 'Recife');


  });

  test('Converter um Pico para um JSON', (){
   const pico = Pico(
    imageUrl: 'imagem.jpg',
    name: 'Pico central',
    type: 'Street',
    rating: 4.5,
    location: 'Recife',
    level: 'intermediate',
    description: 'Pico para skate',
  );

   final json = pico.toJson();

   expect(json['imageUrl'], 'imagem.jpg');
   expect(json['name'], 'Pico central');
   expect(json['type'], 'Street');
   expect(json['rating'], 4.5);
   expect(json['location'], 'Recife');
   expect(json['level'], 'intermediate');
   expect(json['description'], 'Pico para skate');
   
   });

}