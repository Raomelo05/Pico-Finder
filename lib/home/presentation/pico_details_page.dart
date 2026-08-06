import 'package:flutter/material.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';

class PicoDetailsPage extends StatelessWidget{
    
  final Pico pico;

  const PicoDetailsPage({super.key, required
  this.pico});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(pico.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              
              child: Image.asset(
                pico.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              
            ),
            const SizedBox(height: 24),

            Text(
              pico.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),

            Text(
              pico.type,
              style: Theme.of(context).textTheme.titleMedium,
            ),
           const SizedBox(height: 16,),

           Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
           
              const SizedBox(width: 4),
              Text(
                  pico.rating.toString(),
              ),
              const Spacer(),

              const Icon(
                Icons.circle,
                color: Colors.green,
                size: 20,
              ),

              const SizedBox(width: 4),

              Text(
                pico.level,
              ),
          ],
           ),
          
           const SizedBox(height: 16),

           Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 20,
              ),

              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  pico.location,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
            ),
               const SizedBox(height: 24),

               Text(
                'Descrição',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Text(
                pico.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            ),
           

          ),
          
        ),
      );
    
  }
}