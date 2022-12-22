import 'dart:convert';

import 'package:slot_machine/repository/base_users_repository.dart';
import 'package:http/http.dart' as http;

import '../model/users.dart';

class UsersRepository extends BaseUsersRepository {
  @override
  Future<List<Users>> getUsers() async {
    List<Users> users;
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      users = (json.decode(response.body) as List)
          .map((data) => Users.fromMap(data))
          .toList();
      // print(users);
    } else {
      throw Exception('Failed to load users');
    }
    return users;
  }
}
