import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.skateboarding,),
              const Text(
                'Pico Finder',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 8),
             
              const Text(
                'Encontre o próximo pico para sua sessão.',
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                ),
              ),
             const SizedBox(height: 16),
             
             TextField(
              decoration: InputDecoration(
                labelText: 'Senha', 
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))
                ),
              ),
             ),
             const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed:() {}, 
               child: const Text('Entrar'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                ),
               
               ),
               const SizedBox(height: 16),

               
               TextButton(
                onPressed: () {},
                child: const Text('Esqueci minha senha'),
               ),
               
               const SizedBox(height: 16),
               
               TextButton(
                onPressed: () {},
                child: const Text('Criar uma conta'),
               ),
               
               const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}