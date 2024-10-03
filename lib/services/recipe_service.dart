import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'name.dart';

class RecipeService {
  String baseUrl = 'api.agify.io';

  Future<Name?> getNameAge(String name) async {
    final queryParameters = {'name': name, 'country_id': 'FR'};
    final uri = Uri.https(baseUrl, '', queryParameters);
    print(uri);

    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return Name.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  Future<Name?> addNewName(Name newName) async {
    final uri = Uri.https(baseUrl, 'add');
    var response = await http.post(uri, body: newName.toJson());
    return null;
  }
}
