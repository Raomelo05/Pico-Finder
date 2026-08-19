import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:pico_finder/home/presentation/homepage.dart';
import 'package:pico_finder/providers/pico_provider.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:async';

class MockPicoRepository extends Mock implements PicoRepository{}

void main(){
  late MockPicoRepository mockRepository;
  late PicoProvider provider;

  setUp((){
  mockRepository = MockPicoRepository();
  provider = PicoProvider(mockRepository);
  });
  
  testWidgets('Deve exibir o nome do pico na Homepage', (tester) async {
   const pico = Pico
   (imageUrl: 'assets/images/picos/aurora1.png',
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

  await tester.pumpWidget(
    ChangeNotifierProvider.value(
      value: provider,
      child: const MaterialApp(
        home: Homepage(),
      ),
      ),
  );
  
  await tester.pumpAndSettle();
  
  expect(find.text('Pico Central'), findsOneWidget);
  
  });

  testWidgets('deve exivir loading enquanto os picos são carregados', (tester) async {
  final completer = Completer<List<Pico>>();

  when(
    () => mockRepository.loadPicos(),
    ).thenAnswer(
      (_) => completer.future,
    );

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: provider,
        child: const MaterialApp(
          home: Homepage(),
         ),
        ),
      );

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget
      );
  },
  );

  testWidgets( 'deve exibir mensagem de erro quando ocorrer uma falha', (tester) async{
 when(
  () => mockRepository.loadPicos(), 
 ).thenThrow(
  Exception('Erro ao carregar os picos.'),
 );
  await tester.pumpWidget(
    ChangeNotifierProvider.value(
      value: provider,
      child: const MaterialApp(
        home: Homepage(),
      ),
    ),
  );
  await tester.pumpAndSettle();

  expect(
    find.text('Erro ao carregar os picos.'), 
    findsOneWidget,
   );
  },
);
 
 testWidgets('deve exibir mensagem quando não existem picos', 
 (tester) async {
 when(
  () => mockRepository.loadPicos(),
 ).thenAnswer(
  (_) async => [],
 );

 when(
  () => mockRepository.getPicos(),
 ).thenAnswer(
  (_) async => [],
 );

 when(
  () => mockRepository.savePicos([]),
  ).thenAnswer(
    (_) async {},
  );
 
 await tester.pumpWidget(
  ChangeNotifierProvider.value(
    value: provider,
    child: const MaterialApp(
      home: Homepage(),
    ),
   ),
 );
 await tester.pumpAndSettle();

expect(provider.picos.isEmpty, true);
expect(provider.error, null);
expect(provider.isLoading, false);

print(find.byType(Text).evaluate().map((element) {
  final widget = element.widget as Text;
  return widget.data;
}).toList());

 expect(
  find.text('Nenhum pico encontrado'), 
  findsOneWidget,
  );

 },

);

}


