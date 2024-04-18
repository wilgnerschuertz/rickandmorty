import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  // Construtor que recebe um personagem
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/detail', arguments: character);
          },
          child: Card(
            elevation: 0.1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: character.image,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 100,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        character.name,
                        style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: character.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          character.status,
                          style: GoogleFonts.robotoMono(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const Text(' - '),
                        Text(
                          character.species,
                          style: GoogleFonts.robotoMono(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Last know location:',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.robotoMono(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        character.location['name'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.robotoMono(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      '${character.episode.length} episodes',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.robotoMono(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // Card(
    // elevation: 0.3,
    // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    // child: ListTile(
    //   leading: CircleAvatar(
    //     backgroundImage: NetworkImage(character.image),
    //     radius: 32,
    //   ),
    //   title: Text(
    //     character.name,
    //     style: const TextStyle(
    //       fontWeight: FontWeight.w400,
    //     ),
    //   ),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(character.species),
    //       Text(character.status),
    //     ],
    //   ),
    // trailing: IconButton(
    //   icon: const Icon(Icons.arrow_forward),
    //   onPressed: () {
    //     showModalBottomSheet(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return const Text('hello');
    //         });
    //   },
    // ),
    // ),
    // );
  }
}
