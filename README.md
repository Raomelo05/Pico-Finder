# Pico Finder

Pico Finder é um projeto em desenvolvimento com Flutter para criar um aplicativo mobile moderno, com foco em experiência do usuário, organização de código e uma estrutura preparada para evoluir com novas funcionalidades.

## Visão do projeto

Este aplicativo está sendo construído como uma plataforma em crescimento, com uma base inicial voltada para autenticação e navegação, permitindo que novas telas e recursos sejam adicionados de forma organizada.

## O que está sendo desenvolvido

Atualmente, o projeto tem como prioridade:

- estruturar um app com arquitetura limpa e escalável;
- criar uma base visual consistente e profissional;
- desenvolver o fluxo inicial de acesso do usuário;
- preparar o projeto para futuras melhorias, como cadastro, perfil e outras funcionalidades.

## Estado atual

O projeto já conta com:

- uma aplicação Flutter inicializada;
- organização por features e componentes reutilizáveis;
- uma tela de login como ponto de entrada do fluxo principal.

## Como executar

Para rodar o projeto localmente, use:

```bash
flutter pub get
flutter run
```

## Tecnologias utilizadas

- Flutter
- Dart
- Material Design

## Objetivo

O objetivo principal do Pico Finder é servir como uma base sólida para um aplicativo em evolução, refletindo o trabalho atual de desenvolvimento e a direção futura da aplicação.


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