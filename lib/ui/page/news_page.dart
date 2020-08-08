import 'package:easy_localization/easy_localization.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/

import 'package:flutter/material.dart';
import 'package:uzmobile/bloc/news_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final bloc = NewsBloc();

  @override
  void initState() {
//    bloc.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.getNews(context.locale.languageCode);

    return Scaffold(
        appBar: AppBar(
          title: Text("news".tr().toUpperCase()),
        ),
        body: WebViewPlus(
          initialUrl: "https://uztelecom.uz/uz/yangiliklar/yangiliklar",
         onWebResourceError: (w) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('not_loaded_news'.tr()),
            ));
          },
          onPageStarted: (url){
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('loading'.tr()),
            ));
          },
        ));
  }
}
