import 'package:flutter/material.dart';
import 'package:pico_finder/home/widgets/pico_card.dart';
import 'package:pico_finder/home/presentation/pico_details_page.dart';
import 'package:provider/provider.dart';
import 'package:pico_finder/providers/pico_provider.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
  class _HomepageState extends State<Homepage> {
    

    @override
    void initState() {
      super.initState();
    
     context.read<PicoProvider>().carregarPicos();
    }
   
    @override
    Widget build(BuildContext context){
    final provider = context.watch<PicoProvider>();
    final theme = Theme.of(context);
    
    return Scaffold(
   appBar: AppBar(
    title: Text
    ('Pico Finder',
    style: theme.textTheme.headlineSmall
     ),
    ),
   
   body: Builder(
    builder: (context) {

      if (provider.isLoading) {
      return const Center(child: 
      CircularProgressIndicator(),
      );
     }
     
     if (provider.error != null) {
        return const Center(
          child: Text('Erro ao carregar os picos.'),
        );
      }
      
      final picos = provider.picos;

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Street Parks',
            style: theme.textTheme.titleLarge,
          ),
          
          const SizedBox(height: 16),
          
          ...picos.map(
            (pico) => PicoCard(
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
                      builder: (context) => PicoDetailsPage(
                        pico: pico
                        ),
                    ),
                  );
               
                },
              )),
        ],
      );
    }
    ),

   );
}

}

