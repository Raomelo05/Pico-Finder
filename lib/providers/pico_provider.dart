import 'package:flutter/foundation.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';

class PicoProvider extends ChangeNotifier{
  
  final PicoRepository picoRepository;

  PicoProvider(this.picoRepository);
  
  List<Pico> picos = [];

bool isLoading = false;

String? error;

Future carregarPicos() async {
  try {
    isLoading = true;
    error = null;

    notifyListeners();

    final resultado = await picoRepository.getPicos();

    picos = resultado;

    isLoading = false;

    notifyListeners();
  } catch (e) {
    isLoading = false;
    error = 'Erro ao carregar os picos';

    notifyListeners();

  }
}



}