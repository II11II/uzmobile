import 'package:flutter/cupertino.dart';
import 'package:uzmobile/bloc/base/base_bloc.dart';
import 'package:uzmobile/model/all.dart';
import 'package:rxdart/rxdart.dart';

/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
class RateBloc extends BaseBloc {
  ValueNotifier circleColor = ValueNotifier<int>(0);
  final _rates = PublishSubject<List<Tarifs>>();
  Stream<List<Tarifs>> get rates => _rates.stream;
  getRates() async {
    List<Tarifs> tariffs = await repo.getTarifs();
    tariffs.forEach((element) {
      print(element.titleRu);
    });
    _rates.sink.add(tariffs);
  }

  @override
  void dispose() {
    _rates.close();
  }
}
