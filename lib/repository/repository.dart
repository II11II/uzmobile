/* 
@Authour: Islomkuja Akhrorov
Created at: 7/13/20
*/
import 'package:mobiuz/data/api.dart';
import 'package:mobiuz/data/database.dart';
import 'package:mobiuz/model/all.dart';

class Repository {
  static final Repository _repository = Repository._();
  Repository._();
  factory Repository() => _repository;
  Api _api = Api();
  DatabaseProvider _db = DatabaseProvider();

  Future<All> get getAllData => _api.getAllData();

  /// DATABASE
  Future<List<Tarifs>> getTarifs() => _db.getTarifs();
  Future<List<Ism>> getIsms() => _db.getIsms();
  Future<List<Ism>> get getMinuteSms => _db.getMinuteSms();
  Future<int> insertTarifs(Tarifs table) => _db.insertTarifs(table);
  Future<int> insertIsm(Ism table) => _db.insertIsm(table);
  Future<int> updateTarifs(Tarifs table) => _db.updateTarifs(table);
  Future<int> updateIsm(Ism table) => _db.updateIsm(table);
}
