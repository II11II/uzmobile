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
      body: StreamBuilder<RssFeed>(
          stream: bloc.news,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WebViewPlus(
                initialUrl: "https://uztelecom.uz/uz/yangiliklar/yangiliklar",userAgent: "Mozilla/5.0 (Linux; <Android Version>; <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>",
                onWebResourceError: (w) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('not_loaded_news'.tr()),
                  ));
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('not_loaded_news'.tr()),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
