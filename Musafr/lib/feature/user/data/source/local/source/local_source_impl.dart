import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/user_entity.dart';
import 'local_source.dart';

class UserLocalSourceImpl extends UserLocalSource {
  Database? database;

  UserLocalSourceImpl() {
    getDatabase();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> maps = await database.query('user');
    if (maps.isNotEmpty) {
      return UserEntity.fromJson(maps.first);
    }
    return null;
  }

  @override
  Future<void> saveCurrentUser(UserEntity user) async {
    final db = await getDatabase();
    await db.insert(
      'user',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Database> getDatabase() async {
    if (database != null) {
      return Future.value(database);
    }
    database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 1,
      onCreate: (data, version) {
        return data.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, phone_number TEXT, profile_picture TEXT)',
        );
      },
    );
    return Future.value(database);
  }
}
