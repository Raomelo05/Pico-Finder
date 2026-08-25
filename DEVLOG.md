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

## – Componentização, Modelagem de Dados e Lista Dinâmica
🎯 Objetivo da Sprint

Nesta etapa o foco foi evoluir a interface do Pico Finder, tornando-a reutilizável e escalável. O objetivo foi aprender a criar componentes personalizados, modelar dados utilizando classes, exibir informações dinamicamente por meio de listas e compreender como o Flutter trabalha com assets locais.

📚 Conceitos Aprendidos
Componentização

Aprendi a criar widgets reutilizáveis utilizando StatelessWidget, entendendo que um componente deve possuir apenas a responsabilidade de exibir informações, podendo ser utilizado diversas vezes ao longo da aplicação.

Foi criado o componente PrimaryButton, utilizado para padronizar todos os botões da aplicação, e posteriormente o componente PicoCard, responsável por representar um pico de skate.

Também compreendi a importância de utilizar construtores com parâmetros obrigatórios (required) e final, garantindo que cada componente receba apenas as informações necessárias.

Modelagem de Dados

Aprendi a organizar os dados da aplicação através de uma classe de modelo (Model).

Foi criada a classe Pico, contendo informações como:

imagem
nome
tipo
avaliação
localização
nível

Esse conceito permitiu separar os dados da interface, tornando o código mais organizado e preparado para futuramente consumir informações vindas de uma API.

Mock de Dados

Antes de utilizar um banco de dados ou API, aprendi a trabalhar com dados simulados.

Foi criada uma lista constante:

 const List<Pico> mockPicos

contendo diversos picos de skate para alimentar a interface da aplicação.

Esse conceito facilita o desenvolvimento da interface sem depender do backend.

ListView

Aprendi a utilizar o ListView para exibir vários widgets de forma vertical e rolável.

Também compreendi que o children recebe uma lista de widgets, permitindo combinar widgets fixos (como títulos) com widgets gerados dinamicamente.

map()

Aprendi o funcionamento do método map().

Compreendi que ele percorre cada objeto de uma lista e o transforma em outro objeto.

No projeto ele foi utilizado para transformar uma lista de objetos Pico em uma lista de widgets PicoCard.

Spread Operator (...)

Aprendi o funcionamento do operador Spread (...).

Entendi que ele "espalha" todos os widgets gerados pelo map() diretamente dentro da lista de children do ListView, eliminando a necessidade de adicionar cada card manualmente.

Também aprendi que, nesse caso, o método .toList() torna-se desnecessário.

Assets

Aprendi como o Flutter trabalha com imagens locais.

Durante o processo surgiram diversos erros relacionados ao carregamento de assets ("Unable to load asset"), permitindo compreender:

estrutura correta da pasta assets
configuração do pubspec.yaml
importância da identação do YAML
diferença entre caminho físico e caminho lógico do asset
utilização do Image.asset()

Também aprendi a investigar problemas relacionados ao carregamento de imagens utilizando comandos do terminal e verificando a estrutura do projeto.

Debug

Durante esta sprint surgiram diversos erros que precisaram ser investigados.

Entre eles:

ausência do método build()
imports incorretos
utilização de variáveis inexistentes
erros na configuração do pubspec.yaml
caminhos incorretos de imagens
warnings do analisador do Dart
diferença entre erros de compilação e sugestões (Lints)

Essa etapa foi importante para desenvolver a habilidade de interpretar mensagens de erro e localizar a origem dos problemas antes de procurar soluções.

💡 Principais Aprendizados

Ao final desta sprint consegui compreender melhor como um aplicativo Flutter começa a ser estruturado de maneira profissional.

Em vez de repetir código, aprendi a criar componentes reutilizáveis, organizar os dados através de modelos e construir interfaces dinâmicas utilizando listas.

Também desenvolvi uma melhor capacidade de investigar e corrigir erros, entendendo que boa parte do trabalho de um desenvolvedor consiste em interpretar mensagens do compilador e encontrar a causa dos problemas de forma lógica.

🚀 Próximos Passos

Na próxima etapa o objetivo será transformar o Pico Finder em uma aplicação mais interativa, implementando:

Navegação entre telas
Tela de detalhes de cada pico
Passagem de objetos entre páginas
Gerenciamento de estado
Persistência de dados
Consumo de API futuramente


## dica 1 (API)
Fluxo importante da API

 API
 ↓
JSON
 ↓
response.body
 ↓
jsonDecode()
 ↓
List<dynamic>
 ↓
map()
 ↓
Pico.fromJson()
 ↓
List<Pico>
 ↓
FutureBuilder
 ↓
PicoCard

Esse é o fluxo que você precisa saber explicar (provavelmente) no teste técnico.

## dica 2 (State Mangement)

Conceito:	         Para que serve:

StatelessWidget	     UI sem estado local mutável

StatefulWidget	     UI com estado local

setState()	         Atualizar estado local de um StatefulWidget

Provider	         Disponibilizar/organizar estado para widgets

ChangeNotifier	     Notificar que um estado mudou

ChangeNotifierProvider coloca um ChangeNotifier à disposição da árvore de  widgets

notifyListeners()	 Avisar os widgets que estão observando

Consumer	         Permitir que um widget observe um Provider

context.watch()	     Observar o estado e reconstruir quando ele mudar

context.read()	     Acessar o estado sem reconstruir o widget quando ele 
mudar

create               Cria uma instância do Provider




## dica 3 (algumas explicações basicas)

Conceito:	 Para que serve:

String	     Armazenar texto

String?	     Armazenar texto ou null

null	     Representar ausência de valor

error	     Guardar uma mensagem de erro       

## dica 4 (mapa mental)

três estados

Guarde este mapa mental:

             RESPOSTA DA API
                   │
        ┌──────────┼──────────┐
        ↓          ↓          ↓
     Loading      Error      Success
        │          │          │
        ↓          ↓          ↓
    Carregando    Erro       Dados
                              │
                         ┌────┴────┐
                         ↓         ↓
                       Lista      Vazia
                         │         │
                         ↓         ↓
                       Cards    Empty State


Estado:             Para que serve:

isLoading	        Informar que os dados ainda estão sendo carregados

error	            Informar que ocorreu um problema

picos com dados	    Mostrar os picos

picos.isEmpty	    Informar que não existem picos

## persistencia local

o que é persistência?

Persistência significa:

guardar dados para que eles continuem existindo depois que o aplicativo é fechado.

Por exemplo:

Sem persistência:

Abriu app
   ↓
API
   ↓
dados
   ↓
fechou app
   ↓
dados temporários perdidos

Com persistência:

Abriu app
   ↓
API
   ↓
dados
   ↓
salva no dispositivo
   ↓
fecha app
   ↓
abre novamente
   ↓
dados continuam disponíveis

## fluxo com persistencia 

Mapa mental:
                    UI = homepage
                     │
                     ↓
               PicoProvider
                     │
                     ↓
               PicoRepository (decicidindo de onde deve puxar os dados)
                ↙           ↘
               ↓             ↓
             API        Local Storage
               │             │
               ↓             ↓
          Dados remotos  Dados locais

## primeiro conceito: SharedPreferences

é usado para armazenar pequenas informações persistentes, geralmente em formato chave → valor.

Persistência local:
       │
       ├── Storage simples
       │      ↓
       │  SharedPreferences
       │
       └── Dados estruturados
              ↓
          Banco local

## dica 5 

Conceito:	        Para que serve:
SharedPreferences	Persistir pequenos dados no dispositivo
Chave (key)	        Identificar o dado armazenado
Valor (value)	    Informação associada à chave
setString()	        Salvar uma String
getString()	        Recuperar uma String
setBool()	        Salvar um bool
getBool()	        Recuperar um bool
remove()	        Remover um valor

## enxergar o ciclo:

APP
 ↓
SharedPreferences
 ↓
salva um valor
 ↓
app fecha
 ↓
app abre novamente
 ↓
recupera o valor

## dica 6
Método	                    Conversão
Pico.fromJson()	           Map → Pico
pico.toJson()	              Pico → Map
jsonDecode()	              String → Map/List
jsonEncode()	              Map/List → String

## dica 7

Conceito	                Para que serve
toJson()	                Converter um objeto Pico em Map
fromJson()	             Converter um Map em Pico
jsonEncode()	          Converter Map/List em String
jsonDecode()	          Converter String em Map/List
map()	                   Transformar cada elemento de uma coleção
List<Pico>	             Lista de objetos da aplicação
List<Map>	             Estrutura intermediária para JSON
String	                Formato que vamos armazenar no SharedPreferences

## mapa mental:

Mapa completo
             API
              ↓
          JSON String
              ↓
         jsonDecode()
              ↓
             Map
              ↓
       Pico.fromJson()
              ↓
             Pico
              │
              │
          toJson()
              ↓
             Map
              ↓
         jsonEncode()
              ↓
          JSON String
              ↓
      SharedPreferences

## Regra para guardar

Persistência é basicamente fazer o caminho de ida e volta.

Pico
 ↓
Map
 ↓
String
 ↓
Storage

Storage
 ↓
String
 ↓
Map
 ↓
Pico

## dica 8 — Persistência
Conceito	               Para que serve
SharedPreferences	      Armazenar dados simples localmente
setString()	            Salvar uma String
getString()          	Recuperar uma String
toJson()	               Pico → Map
fromJson()	            Map → Pico
jsonEncode()	         Map/List → String
jsonDecode()	         String → Map/List
savePicos()	            Salvar a lista localmente
loadPicos()	            Recuperar a lista localmente

## Mapa mental
                 API
                  ↓
              JSON String
                  ↓
             jsonDecode()
                  ↓
                 Map
                  ↓
            Pico.fromJson()
                  ↓
               List<Pico>
                  │
                  │
              toJson()
                  ↓
              List<Map>
                  ↓
             jsonEncode()
                  ↓
              JSON String
                  ↓
          SharedPreferences
                  │
                  ↓
             getString()
                  ↓
              JSON String
                  ↓
             jsonDecode()
                  ↓
              Pico.fromJson()
                  ↓
               List<Pico>



## Testes:

                 TESTES
                   │
        ┌──────────┼──────────┐
        ↓          ↓          ↓
      Unit       Widget   Integration
        │          │          │
      lógica       UI       aplicativo



## Conceito	           Para que serve
Mock	              Simular uma dependência real durante o teste
Dependência	        Algo que seu código precisa para funcionar
HTTP mockado	     Simular uma resposta da API
Teste isolado	     Testar uma parte sem depender de serviços externos

 guarde esta hierarquia
Unit Test
   │
   ├── Model
   │     ├── fromJson() ✅
   │     └── toJson()   ✅
   │
   └── Repository
         ↓
       HTTP
         ↓
       Mock

       

## Não pense: API vs Mock
Pense:

                  TESTE
                    │
                    ↓
             PicoRepository
                    │
                    ↓
              precisa de HTTP
               ↙           ↘
        produção           teste
           ↓                  ↓
       HTTP real           HTTP mockado
           ↓                  ↓
          API             resposta falsa



## Novo conceito


Conceito	                   Para que serve
Dependência	                Objeto/serviço que uma classe precisa
Injeção de dependência	    Entregar essa dependência para a classe
Mock	                      Implementação falsa usada no teste
http.Client	                Cliente responsável pelas requisições HTTP


Mapa mental:

PicoRepository
      │
      │ recebe
      ↓
 http.Client
   ↙       ↘
real       mock
 ↓          ↓
API       teste



## Dica 9 — Injeção de Dependência

Em vez de uma classe criar ou escolher diretamente aquilo que precisa, nós entregamos a dependência para ela.

No nosso caso:

❌ Repository decide qual HTTP usar


✅ Repository recebe qual HTTP usar

Isso deixa o código mais testável, flexível e desacoplado.

## Dica 10 — setUp vs setUpAll
Conceito	                     Para que serve
setUp()	                     Executa antes de cada teste
setUpAll()	                  Executa uma vez antes de todos os testes
registerFallbackValue()	      Registra um valor que o mocktail pode usar 
                              como fallback
any()	                        Aceita qualquer valor daquele tipo


E guarde esta ideia:
setUpAll()
   ↓
configuração geral dos testes


setUp()
   ↓
preparação individual de cada teste


test()
   ↓
executa o teste

## estado da arquitetura:

                    Pico Finder
                        │
              ┌─────────┴─────────┐
              ↓                   ↓
             API            Persistência Local
              │                   │
              ↓                   ↓
        getPicos()          SharedPreferences
              │                   │
              └─────────┬─────────┘
                        ↓
                  PicoRepository
                        ↓
                    PicoProvider
                        ↓
                       UI


## Dica 11 — Testes de persistência
Conceito:                 Para que serve:

setMockInitialValues()	  Criar armazenamento inicial em memória
setString()	              Simular dados sendo armazenados
getString()	              Recuperar dados armazenados
isNotNull	              Garantir que algo foi salvo
Teste de persistência	  Garantir que salvar/carregar funciona

## Dica 12 — Provider em testes
Conceito:	                   Para que serve:
PicoRepository	                Buscar/salvar os dados
PicoProvider	                Controlar o estado da aplicação
isLoading	                   Informar que uma operação está acontecendo
picos	                         Guardar os dados carregados
error	                         Guardar informação sobre falha
notifyListeners()	             Avisar a UI que o estado mudou

## Dica 13 — Teste por camada

Camada	       Testamos
Pico	          Conversão JSON ↔ objeto
PicoRepository	 API e persistência
PicoProvider	 Estado e regras de negócio
UI	             Comportamento visual/interação

## Conceito:	         Para que serve:

expect()	               Verificar um valor/resultado
verify()	               Verificar se uma chamada aconteceu
.called(1)	            Exigir que tenha acontecido uma vez
when()	               Definir como o Mock deve responder
thenAnswer()	         Definir a resposta assíncrona do Mock

## guarde esta hierarquia

Mocktail
   │
   ├── when()
   │     └── "Quando chamarem isso..."
   │
   ├── thenAnswer()
   │     └── "...responda com isso"
   │
   ├── expect()
   │     └── "O resultado foi o esperado?"
   │
   └── verify()
         └── "Essa ação aconteceu?"

  ## Uma regra importante do Mocktail:

Quando seu código chama uma função do Mock, você precisa dizer ao Mock como ele deve se comportar.

Código chama:
loadPicos()
     ↓
when() + thenAnswer() ✅


Código chama:
getPicos()
     ↓
when() + thenAnswer() ✅


Código chama:
savePicos()
     ↓
when() + thenAnswer() ✅    

Só depois usar o verify...

## Dica 14 — Tratamento de erros em testes
Conceito	                   Para que serve
thenThrow()	                Fazer um Mock lançar uma exceção
catch	                      Capturar uma exceção
error	                      Armazenar informação sobre a falha
finally	                   Executar código independentemente de sucesso ou erro

expect()	                  Verificar o estado final

## Então guarde esta hierarquia:
Mock
 │
 └── thenThrow()
        ↓
     Exception
        ↓
    Provider
        ↓
      catch
        ↓
     error
        ↓
     finally
        ↓
  isLoading = false




## Conceito → Para que serve Widget tests:
Conceito	                   Para que serve
Unit Test	                Testar lógica isoladamente
Widget Test	                Testar comportamento de Widgets
WidgetTester	             Interagir com Widgets durante o teste
pumpWidget()	             Montar um Widget no ambiente de teste
find	                      Procurar Widgets na árvore
findsOneWidget	             Verificar se existe exatamente um Widget


## Mapa mental: Widget test
              TESTES
                 │
        ┌────────┴────────┐
        ↓                 ↓
     LÓGICA               UI
        │                 │
   Unit Test         Widget Test
        │                 │
   Model/Repo/       Homepage/
   Provider          PicoCard

   ## Conceito → Para que serve
Conceito	             Para que serve
Widget Test	          Testar o comportamento de uma parte da interface
WidgetTester	       Controlar e interagir com a árvore de widgets no teste
pumpWidget()	       Montar um widget no ambiente de teste
find	                Procurar widgets na interface
findsOneWidget	       Verificar se existe exatamente um widget
pump()	             Processar mudanças de estado/frame
pumpAndSettle()	    Aguardar até que a árvore estabilize

 Então guarde esta hierarquia:
Widget Test
    │
    ├── pumpWidget()
    │      ↓
    │   monta a UI
    │
    ├── find
    │      ↓
    │   procura algo
    │
    └── expect
           ↓
       verifica se
       está correto

## Dica 16 — Widget Tests
Conceito:	      Para que serve:
testWidgets()	   Criar um teste para Widgets
WidgetTester	   Interagir com a árvore de Widgets
pumpWidget()	   Montar a interface no ambiente de teste
pumpAndSettle()	Processar as atualizações até a UI estabilizar
find.text()	      Procurar um texto na interface
findsOneWidget	   Garantir que existe exatamente um Widget correspondente
Asset de teste	   Fornecer recursos necessários para a UI ser montada

Então guarde esta hierarquia
                   TESTES
                      │
          ┌───────────┴───────────┐
          ↓                       ↓
       Unit Test             Widget Test
          │                       │
          ↓                       ↓
    Model/Repository/       Homepage/PicoCard
       Provider                    │
                                  ↓
                           pumpWidget()
                                  ↓
                              UI montada
                                  ↓
                               find()
                                  ↓

 
## Conceito → Para que serve
Conceito	         Para que serve

Completer	      Permitir controlar manualmente quando um Future termina
Completer.future	   Representar o Future que ainda está pendente
completer.complete()	Liberar o Future e fornecer seu resultado
pump()	            Processar um frame da UI

## Completer
   │
   ├── future
   │     ↓
   │   fica pendente
   │
   └── complete()
         ↓
      Future termina

## Conceito	      Para que serve
testWidgets()	   Criar testes específicos para Widgets
pumpWidget()	   Montar a árvore de Widgets
pump()	         Processar um frame
pumpAndSettle()	Aguardar a UI estabilizar
find.byType()	   Procurar um Widget pelo tipo
CircularProgressIndicator	Representar visualmente o estado de carregamento
Completer	      Controlar manualmente quando um Future termina


Então guarde esta hierarquia
                Widget Test
                     │
                 pumpWidget()
                     │
                     ↓
                  Homepage
                     │
                Provider
                     │
          ┌──────────┴──────────┐
          ↓                     ↓
     isLoading = true       dados carregados
          ↓                     ↓
       Loading               PicoCard
          ↓                     ↓
     pump()                 expect()

## O fluxo do teste 
pumpWidget()
      ↓
Homepage montada
      ↓
initState()
      ↓
carregarPicos()
      ↓
loadPicos()
      ↓
Exception
      ↓
catch
      ↓
error = ...
      ↓
isLoading = false
      ↓
notifyListeners()
      ↓
Homepage reconstrói
      ↓
find.text()
      ↓
expect()

Perceba como temos uma cadeia completa:

Mock
 ↓
Provider
 ↓
Estado
 ↓
UI
 ↓
Teste




Dica 18 — Error State

Conceito	                  Para que serve
thenThrow()	               Simular uma falha
catch	                     Capturar a falha no Provider
error	                     Representar o estado de erro
pumpAndSettle()	         Aguardar a atualização completa da UI
find.text()	               Encontrar uma mensagem na interface


Então guarde esta hierarquia

Erro
  ↓
Exception
  ↓
Provider.catch
  ↓
error != null
  ↓
notifyListeners()
  ↓
Homepage
  ↓
Mensagem de erro

## Dica 19— Widget Tests
Conceito	          Para que serve
testWidgets()	    Testar comportamento de Widgets
pumpWidget()	    Montar a interface
pump()	          Processar um frame
pumpAndSettle()	 Aguardar atualizações assíncronas
find.text()	       Procurar texto na UI
find.byType()	    Procurar um Widget pelo tipo
findsOneWidget	    Garantir exatamente um resultado
Completer	       Controlar um Future durante o teste
thenThrow()	       Simular uma exceção

Então guarde esta hierarquia
                 Homepage
                    │
          ┌─────────┼─────────┐
          ↓         ↓         ↓
       Loading     Error    Success
          ↓         ↓         ↓
       Spinner   Mensagem   PicoCard
                    │
                    └──────────────┐
                                   ↓
                                Empty
                                   ↓
                         Nenhum pico encontrado


E o que você está fazendo nos testes:

MockRepository
      ↓
PicoProvider
      ↓
estado
      ↓
Homepage
      ↓
Widget
      ↓
expect()

## Dica 19 — Empty State
Conceito	          Para que serve
Empty State	       Representar ausência de dados sem tratar como erro
isEmpty	          Verificar se a lista está vazia
find.text()	       Procurar a mensagem na UI
pumpAndSettle()	 Esperar toda a atualização assíncrona terminar

Então guarde esta hierarquia:
                   
                    Homepage
                       │
             ┌─────────┼─────────┐
             ↓         ↓         ↓
          Loading     Error    Resultado
                                  │
                           ┌──────┴──────┐
                           ↓             ↓
                         Empty         Dados
                           ↓             ↓
                    Mensagem          Cards


## Unit Tests:
Conceito	            Para que serve
test() 	            Criar um teste de lógica
expect()	            Comparar resultado esperado e obtido
Mock	               Substituir uma dependência real
when()	            Definir como o Mock deve responder
thenAnswer()	      Definir uma resposta assíncrona
thenThrow()	         Simular uma exceção
verify()	            Verificar se uma chamada aconteceu
setUp()	            Preparar cada teste
setUpAll()	         Fazer uma configuração uma vez para todos os testes
registerFallbackValue()	       Registrar um tipo usado com any()
Completer	                   Controlar manualmente um Future

## Widget Tests:
Conceito	                    Para que serve
testWidgets()	              Testar comportamento da UI
WidgetTester	              Interagir com a árvore de Widgets
pumpWidget()	              Montar a aplicação no ambiente de teste
pump()	                    Processar um frame
pumpAndSettle()	           Aguardar atualizações assíncronas terminarem
find.text()	                 Procurar um texto
find.byType()	              Procurar um Widget pelo tipo
findsOneWidget	              Garantir exatamente um resultado


##gi Então guarde esta hierarquia
                         TESTES
                            │
              ┌─────────────┴─────────────┐
              ↓                           ↓
          Unit Test                  Widget Test
              │                           │
       ┌──────┼──────┐               Homepage
       ↓      ↓      ↓                   │
     Model  Repo   Provider               ↓
       ✅     ✅       ✅              Estados da UI
                                       │
                              ┌────────┼────────┐
                              ↓        ↓        ↓
                           Loading   Error    Empty
                              ✅        ✅        ✅
                                     
                              Success ✅


## Dica 21 — Integration Tests
Conceito	                          Para que serve
integration_test	                 Testar o aplicativo de ponta a ponta
IntegrationTestWidgetsFlutterBinding	Preparar o ambiente de integração
app.main()	                          Iniciar o aplicativo real
-d <device>	          Escolher o dispositivo onde o teste será executado
pumpAndSettle()	                 Aguardar a interface estabilizar

## Conceito → Para que serve
Conceito	                   Para que serve
enterText()	                Simular digitação em um campo
tap()	                      Simular toque em um Widget
find.byType()	             Encontrar Widget pelo tipo
find.text()	                Encontrar um texto
pumpAndSettle()	          Esperar a navegação e atualizações terminarem
Navigator.pushReplacement() Substituir a tela atual pela próxima

## Conceito	Para que serve
app.main()	                        Iniciar o aplicativo real
find.byType(TextFormField)	       Encontrar os campos do formulário
at()	        Selecionar um elemento específico de uma coleção de Widgets
enterText()	              Simular digitação do usuário
tap()	                    Simular toque
pumpAndSettle()	        Aguardar navegação/atualizações da UI
find.text()               Verificar elementos renderizados
Integration Test	 Validar um fluxo real entre várias partes do    aplicativo

## Conceito → Para que serve Validação
Tokens

Conceito	                    Para que serve
Token	Representar            uma sessão/autenticação válida
Access Token	              Permitir acesso autenticado a recursos
Authorization	              Enviar credencial na requisição
Bearer Token	              Formato comum de envio do token
Sessão	                    Estado de usuário autenticado

## Conceito → Para que serve
Conceito	         Para que serve
Unauthenticated	Usuário não está autenticado
Authenticating	   Login está sendo processado
Authenticated	   Usuário está autenticado
Authentication    Error	Login falhou

## Conceito	Para que serve
GET	           Buscar dados
POST	           Enviar dados para o servidor
headers	        Informar metadados da requisição
Content-Type	  Informar o formato do corpo enviado
body	           Dados enviados para a API
jsonEncode()	  Transformar um Map em JSON String
jsonDecode()	  Transformar JSON String em dados Dart
statusCode	     Indicar o resultado HTTP da requisição