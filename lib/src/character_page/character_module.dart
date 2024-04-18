import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/src/character_page/data/datasource/character_remote_datasource.dart';
import 'package:rickandmorty/src/character_page/presentation/pages/character_detail_page.dart';

import 'data/repositories/character_repository_impl.dart';
import 'domain/repositories/character_repository.dart';
import 'domain/usecases/get_all_characters.dart';
import 'presentation/controllers/character_controller.dart';
import 'presentation/pages/character_list_page.dart';

class CharactersModule extends Module {
  @override
  void binds(i) {
    i.add<CharacterRemoteDataSource>(
        CharacterRemoteDataSource.new); // DataSource
    i.add<CharacterRepository>(CharacterRepositoryImpl.new); // Repository
    i.add<GetAllCharacters>(GetAllCharacters.new); // Caso de uso
    i.add<CharacterController>(CharacterController.new); // Controller
    i.add<http.Client>(http.Client.new); // HTTP client
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const CharacterListPage()); // Página inicial

    r.child('/detail',
        child: (context) => CharacterDetailsPage(
              character: Modular.args.data,
            ));
  }
}
