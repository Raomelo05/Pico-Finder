# DEVLOG - Pico Finder

> Objetivo: Registrar os principais conceitos aprendidos durante o desenvolvimento do Pico Finder.

---

# Sprint 0 - Ambiente e Primeiros Widgets

## Objetivos

- [x] Configurar Flutter
- [x] Criar projeto
- [x] Configurar Git
- [x] Executar aplicativo
- [x] Estrutura inicial do projeto

---

## Conceitos

### Widget

Todo elemento da interface é um Widget.

Exemplos:

- Text
- Icon
- Column
- Scaffold
- MaterialApp

---

### Classe → Objeto

Flutter trabalha orientado a objetos.

```dart
MaterialApp
```

Classe

↓

```dart
MaterialApp()
```

Objeto

---

### StatelessWidget

Widget cujo estado nunca muda.

```dart
class MyApp extends StatelessWidget
```

Possui apenas o método:

```dart
build(BuildContext context)
```

---

### build()

Responsável por desenhar a interface.

Sempre retorna um Widget.

Sempre que a tela precisa ser reconstruída, o Flutter executa novamente esse método.

---

### BuildContext

Representa a posição do Widget dentro da árvore da aplicação.

Utilizado para acessar:

- Theme
- Navigator
- MediaQuery
- Scaffold

---

## Widgets estudados

### Organização

- MaterialApp
- Scaffold
- SafeArea
- Padding
- Center
- Column
- Row
- SizedBox

### Exibição

- Text
- Icon
- Image
- Card

### Entrada

- TextField
- ElevatedButton
- TextButton
- IconButton

---

## Erros que encontrei

- PATH do Flutter incorreto
- Nome inválido do package
- Git não configurado
- Emulador Android lento

---

# Sprint 1 - Login UI

## Objetivos

- [x] Criar Login
- [x] Melhorar Layout
- [x] Criar Design System

---

## Design System

### AppColors

Centraliza todas as cores.

---

### AppSpacing

Centraliza todos os espaçamentos.

---

### AppTextStyles

Centraliza todos os estilos de texto.

---

### AppTheme

Centraliza toda a aparência do aplicativo.

---

## Widgets estudados

### TextField

Campo para entrada de texto.

Principais propriedades

- controller
- decoration
- obscureText

---

### InputDecoration

Personaliza o TextField.

Principais propriedades

- labelText
- hintText
- border
- suffixIcon

---

### OutlineInputBorder

Define borda do campo.

```dart
OutlineInputBorder(
  borderRadius: BorderRadius.circular(40),
)
```

---

### ElevatedButton

Botão principal.

Principais propriedades

- onPressed
- child
- style

---

### ElevatedButton.styleFrom()

Personaliza o botão.

Utilizado para:

- backgroundColor
- foregroundColor
- minimumSize
- shape

---

### RoundedRectangleBorder

Personaliza o formato do botão.

---

## Conceitos

### static

Pertence à classe.

Não precisa criar um objeto.

---

### const

Objeto imutável.

---

### final

Recebe um valor apenas uma vez.

O objeto interno ainda pode sofrer alterações.

---

## Erros que encontrei

- Coloquei width fora do BorderSide.
- Esqueci vírgula após seedColor.
- Coloquei TextStyle dentro de TextStyle.
- Esqueci imports.
- Tentei usar const com IconButton.
- Esqueci fechar parênteses.

---

# Sprint 2 - Estado

## Objetivos

- [x] Aprender StatefulWidget
- [x] Mostrar/Ocultar senha
- [x] Capturar texto digitado

---

## StatefulWidget

Widget cujo estado pode mudar.

Fluxo:

```
StatefulWidget
        │
        ▼
createState()
        │
        ▼
State
        │
        ▼
build()
```

---

## State

Armazena todas as variáveis mutáveis da tela.

Exemplo

```dart
bool _isPasswordVisible = false;
```

---

## setState()

Não altera o estado.

Apenas avisa ao Flutter que houve uma alteração e que a interface deve ser reconstruída.

```dart
setState(() {

});
```

---

## obscureText

Controla se o texto ficará visível.

```dart
obscureText: !_isPasswordVisible
```

---

## IconButton

Botão composto apenas por um ícone.

Principais propriedades

- icon
- onPressed

---

## onPressed()

Executa uma função quando o botão é clicado.

```dart
onPressed: () {

}
```

---

## TextEditingController

Permite acessar o texto digitado.

Exemplo

```dart
emailController.text
```

---

## Fluxo

```
Usuário
     │
     ▼
TextField
     │
     ▼
Controller
     │
     ▼
Código
```

---

## Conceitos importantes

### Variáveis de estado

Mudam durante a execução.

Exemplo

```dart
bool _isPasswordVisible
```

---

### Controllers

Não mudam de referência.

Por isso são declarados como:

```dart
final emailController = TextEditingController();
```

---

## Erros que encontrei

- Coloquei print fora do onPressed.
- Escrevi Print() com P maiúsculo.
- Esqueci remover const do InputDecoration.
- Coloquei código entre parâmetros do ElevatedButton.
- Tentei usar final em variável de estado.

---

# Sprint 3 - Formulários

## Objetivos

- [] Form
- [ ] GlobalKey
- [ ] TextFormField
- [ ] Validator
- [ ] Navegação
- [ ] HomePage

---

## Próximos conceitos

- Form
- FormState
- GlobalKey
- Validator
- Navigator
- Rotas

# Form 

Responsável por agrupar e controlar um formulário.

Trabalha em conjunto com TextFormField.

Permite validar todos os campos de uma única vez.

Estrutura:
Form
 └── Column
      ├── TextFormField
      ├── TextFormField
      └── ElevatedButton

       
# GlobalKey<FormState>

Cria uma referência para o Form.

final _formKey = GlobalKey<FormState>();

FormState

Representa o estado atual do formulário.

# Principais métodos:

validate()
save()
reset()

# validator

Função responsável por validar um campo.

Recebe:

(value)

Retorna:

String → existe erro.
null → campo válido.

Exemplo:

validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }

  return null;
}

# validate()

Executa todos os validator do formulário.

Retorna:

true → todos os campos válidos.
false → existe pelo menos um erro.

Uso:

if (_formKey.currentState!.validate()) {
  // Continua o fluxo
}

## Fluxo do Form
Clique no botão
        │
        ▼
validate()
        │
        ▼
Executa todos os validators
        │
        ▼
Todos válidos?
    │          │
   Sim        Não
    │          │
 Continua   Exibe erros

 ## Conceitos aprendidos
Form é um Widget, não um parâmetro.
Cada TextFormField valida apenas seu próprio campo.
O Form coordena a validação de todos os campos.
validate() retorna um bool.
A lógica do login deve acontecer apenas quando validate() retornar true.

## 🐛 Erros encontrados
Tentei adicionar form: como parâmetro do Padding.
Esqueci a vírgula após o validator.
Tive dificuldade com os parênteses da árvore de widgets.
Coloquei o código do login fora do if, fazendo com que ele fosse executado mesmo com o formulário inválido.

### Navigator

Responsável por controlar a navegação entre as telas do aplicativo.

Internamente funciona como uma pilha (Stack).

A tela mais recente fica sempre no topo da pilha.

Stack (Pilha)

Exemplo:

Perfil
──────
Home
──────
Login

O usuário visualiza apenas a tela do topo.

## Navigator.push()

Adiciona uma nova tela na pilha.

Exemplo:

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const Homepage(),
  ),
);

Fluxo:

Login

↓

Home

↓

Voltar

↓

Login

## Navigator.pushReplacement()

Substitui a tela atual por outra.

Exemplo:

Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const Homepage(),
  ),
);

Fluxo:

Login

↓

Home

↓

Voltar

↓

Aplicativo fecha (ou minimiza)

Ideal para:

Login
Splash Screen
Onboarding
Logout

## MaterialPageRoute

Representa uma rota entre duas telas.

Recebe um builder responsável por construir a próxima página.

Exemplo:

MaterialPageRoute(
  builder: (context) => const Homepage(),
)
builder

É uma função que cria a tela quando ela for necessária.

Exemplo:

builder: (context) => const Homepage()
BuildContext

O Navigator utiliza o BuildContext para localizar o ponto da árvore de widgets onde a navegação deve acontecer.

Fluxo da navegação
Clique no botão

↓

validate()

↓

true

↓

Navigator.pushReplacement()

↓

HomePage

# Conceitos aprendidos
O Navigator não valida informações.
O Navigator apenas troca de telas.
A validação continua sendo responsabilidade do Form.
push() adiciona uma tela à pilha.
pushReplacement() substitui a tela atual.
Cada tela é um Widget.
MaterialPageRoute define qual tela será aberta.
builder cria a nova tela.

# 🐛 Erros encontrados
Esqueci o ; após o Navigator.push().
Não utilizei const Homepage().
Tive dúvida sobre a animação padrão do MaterialPageRoute.
Entendi que o comportamento do botão Voltar depende da pilha do Navigator.

## Widget reutilizável (PrimaryButton)

Um widget personalizado é uma classe criada pelo desenvolvedor para encapsular um conjunto de widgets e reutilizá-los em várias partes da aplicação.

Exemplo:

class PrimaryButton extends StatelessWidget
Objetivo

Evitar repetição de código e centralizar a aparência e o comportamento de componentes reutilizados.

# Estrutura

Um widget reutilizável possui:

atributos (final)
construtor
método build()

Exemplo:

final String text;
final VoidCallback onPressed;

## required

Obriga quem utiliza o widget a fornecer os parâmetros necessários.

Exemplo:

PrimaryButton(
  text: 'Entrar',
  onPressed: () {},
)

# VoidCallback

Representa uma função sem parâmetros e sem retorno.

É utilizado para ações como onPressed.

Composição de Widgets

O PrimaryButton não cria um botão do zero.

Ele reutiliza um ElevatedButton.

PrimaryButton
        ↓
ElevatedButton

No Flutter, widgets podem ser compostos por outros widgets.

Benefícios:
Evita repetição de código.
Centraliza alterações visuais.
Facilita manutenção.
Melhora organização do projeto.
Torna as telas mais limpas.
Favorece reutilização de componentes.
Conceitos aprendidos
Criar um widget personalizado.
Receber dados pelo construtor.
Repassar esses dados para widgets internos.
Utilizar required.
Utilizar VoidCallback.
Aplicar abstração.
Aplicar composição de widgets.
Aplicar o princípio da responsabilidade única (Single Responsibility Principle).

