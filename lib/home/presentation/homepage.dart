import 'package:flutter/material.dart';
import 'package:pico_finder/core/constants/theme/routes/services/utils/widgets/pico_card.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
   appBar: AppBar(
    title: 
    Text('Pico Finder',
    style: theme.textTheme.headlineSmall
    ),
    ),
   
   body: ListView(
      padding: const EdgeInsets.all(16), children: [
      Text( 'Street Parks',
      style: theme.textTheme.titleLarge,
      ),
      const SizedBox(height: 16),
      PicoCard(imageUrl: 'assets/images/picos/aurora1.png', 
      name: 'Aurora Skatepark', 
      type: 'Street Park', 
      rating: 4.8, 
      location: 'Rua da Aurora,Recife,PE', 
      level: 'iniciantes', 
      onTap:  (){
            print('Card clicado');

      },
      ),
   
    ],
   ),
   );

}
}
