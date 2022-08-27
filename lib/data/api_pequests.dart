import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  // ignore: prefer_final_fields
  static String? _nextUrl = 'https://rickandmortyapi.com/api/character/?page=1';

  static bool get isLastUrl => _nextUrl == null;

  static set firstUrl(String firstUrl) => _nextUrl = firstUrl;

  static Future<List<Character>>? addCharacters(
      List<Character> characters) async {
    if (_nextUrl == null) {
      return characters;
    }
    final response = await http.get(Uri.parse(_nextUrl!));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      _nextUrl = json['info']['next'];
      for (var character in json['results']) {
        characters.add(Character(character));
      }
    }

    return characters;
  }
}

class Character {
  late int id;
  late String name;
  late bool status;
  late String species;
  late String gender;
  late String origin;
  late String location;
  late String image;

  Character(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'] == 'Alive';
    species = json['species'];
    gender = json['gender'];
    origin = json['origin']['name'];
    location = json['location']['name'];
    image = json['image'];
  }
}
