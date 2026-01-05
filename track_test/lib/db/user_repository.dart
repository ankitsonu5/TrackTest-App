import '../model/user_model.dart';
import 'database_helper.dart';

class UserRepository {
  final dbHelper = DatabaseHelper.instance;

  /// SIGNUP
  Future<int> registerUser(UserModel user) async {
    final db = await dbHelper.database;
    return await db.insert('users', user.toMap());
  }

  /// LOGIN
  Future<UserModel?> login(String email, String password) async {
    final db = await dbHelper.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }
}
