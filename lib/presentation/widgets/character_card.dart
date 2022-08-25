import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/api_pequests.dart';
import 'package:rick_and_morty_app/presentation/pages/character_page.dart';
import 'alive_status.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({required this.character, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterPage(character: character),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Container(
              color: Colors.white,
              height: 170,
              width: 170,
              child: Image.network(
                character.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            height: 55,
            width: 170,
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  character.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Play',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: AliveStatus(6, character.status),
                    ),
                    Expanded(
                      child: Text(
                        "${character.status ? "Alive" : "Dead"} - ${character.species}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Play',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
