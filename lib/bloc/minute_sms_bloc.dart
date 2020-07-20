import 'package:flutter/cupertino.dart';
import 'package:mobiuz/bloc/base/base_bloc.dart';
import 'package:mobiuz/model/all.dart';
import 'package:rxdart/rxdart.dart';

/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/

class MinuteSmsBloc extends BaseBloc {
  final _minuteSms = PublishSubject<List<Ism>>();
  Stream<List<Ism>> get minuteSms => _minuteSms.stream;

  List<ValueNotifier> showButtons;
  Future getMinuteSms() async {
    List<Ism> results = await repo.getMinuteSms;
    _minuteSms.sink.add(results);
    showButtons =
        List.generate(results.length, (index) => ValueNotifier<bool>(false));
  }

  @override
  void dispose() {
    _minuteSms.close();
  }
}
