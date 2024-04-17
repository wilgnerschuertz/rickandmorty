// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rickandmorty/src/character_page/presentation/controllers/character_controller.dart';
import '../widgets/character_card.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late final CharacterController store;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store = Modular.get<CharacterController>();
    store.fetchCharacters(1); // Carrega a primeira página inicialmente
    //verifica se o usuário chegou ao final do scroll (Mudar para uma função fora parte)
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        store.loadMoreCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/svg/rick_and_morty.svg',
          height: 44,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Lottie.asset('assets/lottie/loadingmorty.json'),
                  ),
                ),
                const Text('Wubba-lubba-dub-dub!'),
              ],
            );
          }
          return ListView.builder(
            controller:
                _scrollController, // Faz a mágica acontecer (Adiciona +1 no page e chama mais personagens (Passar para o controller depois.))
            itemCount: store.characters.length,
            itemBuilder: (context, index) =>
                CharacterCard(character: store.characters[index]),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); //dispor o controlador ao sair da tela
    super.dispose();
  }
}
