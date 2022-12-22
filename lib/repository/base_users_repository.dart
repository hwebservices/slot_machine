import '../model/users.dart';

abstract class BaseUsersRepository {
  Future<List<Users>> getUsers();
}
