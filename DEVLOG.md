# DEVLOG

## Sprint 0

### O que aprendi

- Configurar o Flutter.
- Criar um projeto Flutter.
- Estrutura inicial de um projeto.
- Git Flow (main, develop e feature).
- Conventional Commits.

### Dificuldades

- PATH do Flutter.
- Nome do package.
- Configuração do Git.
- Emulador Android.

### Próximos passos

- Configurar um dispositivo Android físico.
- Estudar Widgets.

### Novos aprendizados 

O que é um Widget?
Widget é qualquer elemento da interface do usuário.


- MaterialApp ;É a aplicação Flutter. Configura tema, rotas e mais.
- Scaffold ;Estrutura básica de uma tela (como uma "folha em branco").
- SafeArea :Evita que o conteúdo fique embaixo do notch, barra de status etc.
- Center ;Centraliza um widget.
- Padding ;Adiciona espaçamento interno.
- Column ;Organiza widgets na vertical.

### Novos aprendizados 1
Quase tudo no Flutter segue essa lógica:

Classe
↓
Objeto
↓
Objeto Constante (quando possível)

No Flutter, quase tudo o que colocamos na tela é um objeto criado a partir de uma classe que representa um Widget.

Estado é qualquer informação que pode mudar durante a execução do aplicativo.

### conceitos do flutter

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }

}
= 

A classe MyApp herda de StatelessWidget, ou seja, ela representa um Widget sem estado mutável.

O construtor const MyApp({super.key}) cria um objeto constante da classe MyApp. O super.key envia a Key para a classe pai (StatelessWidget).

O método build() retorna um Widget. Ele recebe um BuildContext como parâmetro e devolve um MaterialApp, que será desenhado pelo Flutter.

MaterialApp = Classe
MaterialApp(...) = Objeto
home = Parâmetro nomeado
MyHomePage() = Outro objeto

Center(
    child: Text("Olá")
)

classe center
Construtor Center()
Objeto Center

Recebe um parâmetro chamado child
Dentro desse parâmetro existe outro objeto
Text()

### Novos aprendizados 2

- Scaffold: O Scaffold é a estrutura básica de uma tela Material Design.

body: é um parâmetro nomeado do Scaffold.

Center() ; classe com objetivo de centralizar o widget

child: parametro do construtor de Center que recebe um Text por ex

### diferentes tipos de widgets
Widgets de organização

Scaffold
SafeArea
Column
Row
Padding
Center
SizedBox

Widgets de interação
TextField
ElevatedButton
IconButton
GestureDetector
Checkbox

Widgets de exibição
Text
Icon
Image
Card
