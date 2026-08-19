import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';
import 'package:pico_finder/providers/pico_provider.dart';

class MockPicoRepository extends Mock implements PicoRepository{}

void main(){
  late MockPicoRepository mockRepository;
  late PicoProvider provider;


  setUp((){
  mockRepository = MockPicoRepository();
  provider = PicoProvider(mockRepository);
  });

  test('Deve carregar picos salvos localmente', () async {
  const pico = Pico(
  imageUrl: 'imagem.jpg',
  name: 'Pico Central',
  type: 'Street',
  rating: 4.5,
  location: 'Recife',
  level: 'intermediate',
  description: 'Pico para skate',
);
when(
  () => mockRepository.loadPicos(),
).thenAnswer(
  (_) async => [pico],
);

await provider.carregarPicos();

expect(provider.picos.length, 1);
expect(provider.picos.first.name, 'Pico Central');
expect(provider.isLoading, false);
expect(provider.error, null);

 });
 
 test('Deve buscar na API quando não existem picos locais', () async {
 const pico = Pico(
  imageUrl: 'imagem.jpg',
  name: 'Pico Central',
  type: 'Street',
  rating: 4.5,
  location: 'Recife',
  level: 'intermediate',
  description: 'Pico para skate',
);
 when(
  () => mockRepository.loadPicos(),
 ).thenAnswer(
  (_) async => [],
 );

 when(
  () => mockRepository.getPicos(),
 ).thenAnswer(
  (_) async => [pico],
 );

 when(
  () => mockRepository.savePicos([pico]),
 ).thenAnswer(
  (_) async {},
 );
 
 await provider.carregarPicos();

  expect(provider.picos.length, 1);
  expect(provider.picos.first.name, 'Pico Central');
  expect(provider.isLoading, false);
  expect(provider.error, null);

 verify(
  () => mockRepository.savePicos([pico]),
 ).called(1);
 
 });

 test('deve armazenar erro quando ocorrer uma exeção', () async{
   when(  
    () => mockRepository.loadPicos(),
   ).thenThrow(
    Exception('Erro ao carregar picos'),
   );

   await provider.carregarPicos();

   expect(provider.error, 'Exception: Erro ao carregar picos');
   expect(provider.isLoading, false);
 
 });
}