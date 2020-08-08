import 'package:flutter/cupertino.dart';
import 'package:uzmobile/bloc/base/base_bloc.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:uzmobile/model/all.dart';
import 'package:rxdart/rxdart.dart';

class InternetBloc extends BaseBloc {
  final _paketi = BehaviorSubject<List<Ism>>();

  Stream<List> get paketi => _paketi.stream;
  final _onnet = BehaviorSubject<List<Ism>>();
  Stream<List> get onnet => _onnet.stream;

  final _night = BehaviorSubject<List<Ism>>();
  Stream<List> get night => _night.stream;

  List<ValueNotifier> showButtonsOnnet;
  List<ValueNotifier> showButtonsNight;
  List<ValueNotifier> showButtonsPaketi;

  Future getInternet() async {
    List<Ism> night = await repo.getInternetNight;
    List<Ism> onnet = await repo.getInternetOnnet;
    List<Ism> paketi = await repo.getInternetPaketi;

    showButtonsNight =
        List.generate(night.length, (index) => ValueNotifier<bool>(false));
    showButtonsOnnet =
        List.generate(onnet.length, (index) => ValueNotifier<bool>(false));
    showButtonsPaketi =
        List.generate(paketi.length, (index) => ValueNotifier<bool>(false));

    _paketi.sink.add(paketi);
    _night.sink.add(night);
    _onnet.sink.add(onnet);
  }

  @override
  void dispose() {
    _paketi.close();
    _onnet.close();
    _night.close();
  }
}
