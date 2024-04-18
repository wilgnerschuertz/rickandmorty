import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';
import '../widgets/character_detail_card.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: CharacterDetailCard(character: character),
      ),
    );
  }
}
