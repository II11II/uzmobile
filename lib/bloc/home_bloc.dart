/* 
@Authour: Islomkuja Akhrorov
Created at: 7/13/20
*/

import 'dart:io';

import 'package:uzmobile/model/all.dart';
import 'package:rxdart/rxdart.dart';

import 'base/base_bloc.dart';

class HomeBloc extends BaseBloc {
  final _data = PublishSubject<All>();
  Stream<All> get data => _data.stream;
  Future<String> getData() async {
    try {
      All all = await repo.getAllData;
      
      print(all.tarifs.length);
      print(all.ism.length);
      for (Tarifs i in all.tarifs) {
        print("data : ${i.ord}");
        int tariff = await repo.insertTarifs(i);
        print("info: Tarif: $tariff");
      }
      for (var i in all.ism) {
        int ism = await repo.insertIsm(i);
        print("info: ism: $ism");
      }
      List<Ism> isms = await repo.getIsms();
      isms.forEach((element) {
        print("db" + element.id);
      });

      all.tarifs.forEach((element) {
        print(element.titleRu);
      });
      _data.sink.add(all);
      return "refreshed";
    } on HttpException catch (e) {
      print(e);
      return "noConnection";
    } on Exception catch (e) {
      print(e);
      return "otherProblem";
    }
  }

  @override
  void dispose() {
    _data.close();
  }
}
