import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:rickandmorty/src/character_page/character_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<Client>(Client.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: CharactersModule());
  }
}
