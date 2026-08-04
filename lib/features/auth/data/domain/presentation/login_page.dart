import 'package:flutter/material.dart';
import 'package:pico_finder/home/presentation/homepage.dart';
import 'package:pico_finder/core/constants/theme/routes/services/utils/widgets/primary_button.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool _isPasswordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
  @override
  
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form( 
            key: _formKey,
            child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.skateboarding,),
               Text(
                'Pico Finder',
                style: theme.textTheme.headlineSmall
              ),
               const SizedBox(height: 8),
             
               Text(
                'Encontre o próximo pico para sua sessão.',
                style: theme.textTheme.bodyMedium,
                
                
              
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  
              
                  ),
                ),
              
             const SizedBox(height: 16),
             
             TextFormField(
              
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                if (value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
              controller: passwordController,
              decoration:  InputDecoration(
                labelText: 'Senha', 
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility), 
                  onPressed: (){
                   setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  ),
                
                 ),
                 obscureText: !_isPasswordVisible,
                 ),
               
                  const SizedBox(height: 16),
            
            PrimaryButton(
              text: 'Entrar',
              
              onPressed:() {
               if (_formKey.currentState!.validate()){
               print (emailController.text);
               print (passwordController.text);
               Navigator.pushReplacement(
                context, 
               MaterialPageRoute(
                builder: (context) => const Homepage(),
               ),
                );
               }
               
              }, 
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
    ),
        ),
    );
  }
}