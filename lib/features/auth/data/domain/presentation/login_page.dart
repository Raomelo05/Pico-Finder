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
              const Text(
                'Pico Finder',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Encontre os melhores picos de skate da sua região',
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
             const SizedBox(height: 16),
             
             TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    // Lógica para mostrar/ocultar a senha
                  },
                ),
              ),
             ),
             const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed:() {}, 
               child: const Text('Entrar'),
               ),
             
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