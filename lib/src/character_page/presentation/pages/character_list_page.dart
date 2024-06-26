import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rickandmorty/src/character_page/presentation/stores/character_store.dart';
import '../widgets/character_card.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late final CharacterStore store;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store = Modular.get<CharacterStore>();
    store.fetchCharacters(1);
    store.updateDataInBackground();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      if (!store.state.isLoading && !store.isLastPage) {
        store.loadMoreCharacters();
      }
    }
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
          if (store.state.isLoading) {
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
          return RefreshIndicator(
            onRefresh: store.refreshCharacters,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: store.state.characters.length,
              itemBuilder: (context, index) =>
                  CharacterCard(character: store.state.characters[index]),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispor o controlador ao sair da tela
    super.dispose();
  }
}
