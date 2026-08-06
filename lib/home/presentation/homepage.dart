import 'package:flutter/material.dart';
import 'package:pico_finder/home/widgets/pico_card.dart';
import 'package:pico_finder/home/presentation/pico_details_page.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});

final PicoRepository picoRepository = PicoRepository();

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
   
   body: FutureBuilder<List<Pico>>(
    future: picoRepository.getPicos(),
    builder: (context, snapshot) {
      
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator());
      }
      final picos = snapshot.data!;

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Street Parks',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...picos.map((pico) => PicoCard(
                imageUrl: pico.imageUrl,
                name: pico.name,
                type: pico.type,
                rating: pico.rating,
                location: pico.location,
                level: pico.level,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PicoDetailsPage(pico: pico),
                    ),
                  );
                  print('Card clicado: ${pico.name}');
                },
              )),
        ],
      );
    }
    ),

   );
   

}
}
