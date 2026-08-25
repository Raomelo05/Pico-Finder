import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pico_finder/main.dart' as app;
import 'package:pico_finder/home/widgets/pico_card.dart';
import 'package:pico_finder/home/presentation/pico_details_page.dart';

void main (){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('deve iniciar o pico finder', 
  (tester) async{
    app.main();
   
    await tester.pumpAndSettle();
    
    final campos = find.byType(TextFormField);

    expect(campos, findsNWidgets(2));

    await tester.enterText(
      campos.at(0), 
      'teste@gmail.com',
      
      );
    
    await tester.enterText(
      campos.at(1),
     '123456',
     
      );

    await tester.tap(
        find.text('Entrar'),
      );

    await tester.pumpAndSettle();

    expect(
      find.text('Pico Finder'), 
      findsOneWidget,
      
    );   

    await tester.tap(
      find.byType(PicoCard).first,
    );

    await tester.pumpAndSettle();
    
    expect(
    find.byType(PicoDetailsPage), 
    findsOneWidget,
    
    );
  },
);

}