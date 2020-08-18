import 'package:flutter/cupertino.dart';
import 'package:uzmobile/bloc/base/base_bloc.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:uzmobile/model/all.dart';
import 'package:rxdart/rxdart.dart';

class MinuteSmsBloc extends BaseBloc {
  String prev,curr;int i=-1;
  final _minuteSms = PublishSubject<All>();

  Stream<All> get minuteSms => _minuteSms.stream;

  List<ValueNotifier> showButtons;

  Future getMinuteSms() async {
    List<Ism> minuteSms = await repo.getMinuteSms;
    List<Category> category = await repo.getMinuteSmsCategory;
      All all=All();
       category.add(category[0]);
       category.removeAt(0);
      all.category=category;

      all.ism=minuteSms;
    _minuteSms.sink.add(all);

    showButtons =
        List.generate(minuteSms.length, (index) => ValueNotifier<bool>(false));
  }

  @override
  void dispose() {
    _minuteSms.close();
  }
}
