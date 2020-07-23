import 'package:mobiuz/bloc/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webfeed/domain/rss_feed.dart';

/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
class NewsBloc extends BaseBloc {
  final _news = PublishSubject<RssFeed>();
  Stream<RssFeed> get news => _news.stream;
  Future getNews(String localization) async {
    try {
      String rss = await repo.getNews(localization);
      print(rss);
      _news.sink.add(RssFeed.parse(rss));
    } catch (e) {
      print(e);
      _news.addError('error');
    }
  }

  @override
  void dispose() {
    _news.close();
  }
}
