import 'package:flutter/foundation.dart';
import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:pico_finder/features/auth/data/repositories/pico_repository.dart';

class PicoProvider extends ChangeNotifier{
  
  final PicoRepository picoRepository;

  PicoProvider(this.picoRepository);
  
  List<Pico> picos = [];

bool isLoading = false;

String? error;

Future<void> carregarPicos() async {
  isLoading = true;
  error = null;
  notifyListeners();
 
 
 try {
    final picosSalvos = await picoRepository.loadPicos();
    
    if (picosSalvos.isNotEmpty) {
      picos = picosSalvos;
    } else {
      final picosApi = await picoRepository.getPicos();

      picos = picosApi;

      await picoRepository.savePicos(picosApi);
    }
   
  } catch (e) {
  error = e.toString();
  }finally{
   isLoading = false;
   notifyListeners();
 }
}

}