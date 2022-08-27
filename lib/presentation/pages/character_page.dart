import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/api_pequests.dart';
import 'package:rick_and_morty_app/presentation/widgets/alive_status.dart';

class CharacterPage extends StatelessWidget {
  Character character;
  CharacterPage(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontFamily: 'Play',
      color: Colors.black,
      fontSize: 24,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(221, 225, 238, 1),
        body: Stack(
          children: [
            Image.network(
              character.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                height: 460,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        character.name,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Play',
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: AliveStatus(16, character.status),
                          ),
                          Expanded(
                            child: Text(
                              "${character.status ? "Alive" : "Dead"} - ${character.species}",
                              overflow: TextOverflow.ellipsis,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          style: textStyle,
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Gender: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: character.gender,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          style: textStyle,
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Origin: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: character.origin,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          style: textStyle,
                          children: <TextSpan>[
                            const TextSpan(
                              text: "Location: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: character.location,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
