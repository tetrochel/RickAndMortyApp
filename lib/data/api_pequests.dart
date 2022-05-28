import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  static Future<List<Character>>? addCharacters(
      List<Character> characters, int page) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body)['results'];
      for (int i = 0; i < 20; i++) {
        characters.add(Character(json[i]));
      }
      return characters;
    } else {
      throw Exception('Failed to load Character');
    }
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
