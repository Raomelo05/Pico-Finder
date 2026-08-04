import 'package:flutter/material.dart';
import 'package:pico_finder/core/constants/theme/routes/services/utils/widgets/pico_card.dart';
import 'package:pico_finder/features/auth/data/pico_mock.dart';


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
      ...mockPicos .map((pico) => PicoCard(
        imageUrl: pico.imageUrl,
        name: pico.name,
        type: pico.type,
        rating: pico.rating,
        location: pico.location,
        level: pico.level,
        onTap: () {
          print('Card clicado: ${pico.name}');
        },
      ),
      ),       
    
    ],
   ),
   );

}
}
