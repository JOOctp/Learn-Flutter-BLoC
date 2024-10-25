import 'dart:convert';

import 'package:learn_bloc/model/user.dart';
import 'package:learn_bloc/model/response/base_response.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> getPokemon() async {
    try {
      final response = await http.get(Uri.parse("https://reqres.in/api/users?per_page=12"));
      BaseResponse<User> pokemonResponse = BaseResponse.fromJson(jsonDecode(response.body), (data) => User.fromJson(data));
      if (response.statusCode == 200) {
        return pokemonResponse.data ?? List.empty();
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

}