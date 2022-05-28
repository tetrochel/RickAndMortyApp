import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/api_pequests.dart';
import 'package:rick_and_morty_app/presentation/pages/character_page.dart';
import 'alive_status.dart';

class CharacterCard extends StatelessWidget {
  Character character;
  CharacterCard(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterPage(character),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 170,
              width: double.infinity,
              child: Image.network(character.image, fit: BoxFit.fill),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.white,
              ),
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
      ),
    );
  }
}
