import 'package:pico_finder/features/auth/data/models/pico.dart';
import 'package:pico_finder/features/auth/data/pico_mock.dart';

class PicoRepository {
  Future<List<Pico>> getPicos() async {
   
   await Future.delayed(const Duration(seconds: 3));

    return mockPicos;
  }
}