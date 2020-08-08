/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:uzmobile/model/all.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum TarifsEnum {
  id,
  name,
  title_uz,
  title_ru,
  kod,
  photo,
  descr_uz,
  descr_ru,
  ord
}
enum IsmEnum {
  id,
  price,
  title_uz,
  title_ru,
  kod,
  catid,
  type,
  desc_uz,
  desc_ru,
  cat_uz,
  cat_ru,
  status
}

class DatabaseProvider {
  static final DatabaseProvider _db = DatabaseProvider._();

  DatabaseProvider._();

  factory DatabaseProvider() => DatabaseProvider._db;
  Database db;

  Future open() async {
    print(TarifsEnum.id.toString());
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'uzmobile.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
CREATE TABLE ${Tarifs.tableName} ( 
  ${TarifsEnum.id.toString().split('.').last} INTEGER PRIMARY KEY AUTOINCREMENT, 
  ${TarifsEnum.name.toString().split('.').last} text,
  ${TarifsEnum.title_uz.toString().split('.').last} text,
  ${TarifsEnum.title_ru.toString().split('.').last} text,
  ${TarifsEnum.kod.toString().split('.').last} text,
  ${TarifsEnum.photo.toString().split('.').last} text,
  ${TarifsEnum.descr_uz.toString().split('.').last} text,
  ${TarifsEnum.descr_ru.toString().split('.').last} text,
  ${TarifsEnum.ord.toString().split('.').last} text )
''');
      await db.execute('''
create table ${Ism.tableName} ( 
  ${IsmEnum.id.toString().split('.').last} integer primary key autoincrement, 
  ${IsmEnum.price.toString().split('.').last} text ,
  ${IsmEnum.title_uz.toString().split('.').last} text ,
  ${IsmEnum.title_ru.toString().split('.').last} text ,
  ${IsmEnum.kod.toString().split('.').last} text ,
  ${IsmEnum.catid.toString().split('.').last} text ,
  ${IsmEnum.type.toString().split('.').last} text ,
  ${IsmEnum.desc_uz.toString().split('.').last} text ,
  ${IsmEnum.desc_ru.toString().split('.').last} text ,
  ${IsmEnum.cat_uz.toString().split('.').last} text ,
  ${IsmEnum.cat_ru.toString().split('.').last} text ,
  ${IsmEnum.status.toString().split('.').last} text )
''');
    });
  }

  Future<int> insertIsm(Ism table) async {
    await open();
    try {
      int result = await db.insert(Ism.tableName, table.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      await close();
      return result;
    } on DatabaseException catch (e) {
      print(e);
      updateIsm(table);
      return 100;
    }
  }

  Future<int> insertTarifs(Tarifs table) async {
    await open();
    try {
      int result = await db.insert(Tarifs.tableName, table.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      await close();
      return result;
    } on DatabaseException catch (e) {
      print(e);
      updateTarifs(table);
      return 100;
    }
  }

  Future<List<Tarifs>> getTarifs() async {
    await open();
    List<Map> maps = await db.query(
      Tarifs.tableName,
    );
    await close();

    if (maps.length > 0) {
      return maps.map((e) => Tarifs.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Ism>> getIsms() async {
    await open();
    List<Map> maps = await db.query(
      Ism.tableName,
    );
    await close();
    if (maps.length > 0) {
      return maps.map((e) => Ism.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Ism>> getMinuteSms() async {
    await open();
    List<Map> maps = await db.query(
      Ism.tableName,
      where: "${IsmEnum.catid.toString().split('.').last}='0'",
    );
    await close();
    if (maps.length > 0) {
      return maps.map((e) => Ism.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Ism>> getInternetOnnet() async {
    await open();
    List<Map> maps = await db.query(
      Ism.tableName,
      where: "${IsmEnum.catid.toString().split('.').last}='5'",
    );
    print("onnet : ${maps}");
    await close();
    if (maps.length > 0) {
      return maps.map((e) => Ism.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Ism>> getInternetNight() async {
    await open();
    List<Map> maps = await db.query(
      Ism.tableName,
      where: "${IsmEnum.catid.toString().split('.').last}='4'"
          ' or '
          "${IsmEnum.catid.toString().split('.').last}='6'",
    );
    print("night : ${maps}");

    await close();
    if (maps.length > 0) {
      return maps.map((e) => Ism.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<Ism>> getInternetPaketi() async {
    await open();
    List<Map> maps = await db.query(
      Ism.tableName,
      where: "${IsmEnum.catid.toString().split('.').last}='1'"
          ' or '
          "${IsmEnum.catid.toString().split('.').last}='2'"
          ' or '
          "${IsmEnum.catid.toString().split('.').last}='3'",
    );
    print("paketi : ${maps}");

    await close();
    if (maps.length > 0) {
      return maps.map((e) => Ism.fromJson(e)).toList();
    }
    return null;
  }

  Future<int> updateIsm(Ism table) async {
    await open();
    int result = await db.update(
      Ism.tableName,
      table.toJson(),
    );
    await close();
    return result;
  }

  Future<int> updateTarifs(Tarifs table) async {
    await open();
    int result = await db.update(
      Tarifs.tableName,
      table.toJson(),
    );
    await close();
    return result;
  }

  Future close() async => db.close();
}
