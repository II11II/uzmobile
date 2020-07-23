import 'package:easy_localization/easy_localization.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/

import 'package:flutter/material.dart';
import 'package:mobiuz/bloc/news_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_feed.dart';

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
              List textSpan = List();
              snapshot.data.items.forEach((element) {
                textSpan.add(HTML.toTextSpan(
                  context,
                  element.description,
                  linksCallback: (link) async {
                    if (await canLaunch(link)) launch(link);
                  },
                  // as name suggests, optionally set the default text style
                  defaultTextStyle: TextStyle(color: Colors.grey[700]),
                  overrideStyle: {
                    "p": TextStyle(fontSize: 17.3),
                    "a": TextStyle(wordSpacing: 2),
                    // specify any tag not just the supported ones,
                    // and apply TextStyles to them and/override them
                  },
                ));
              });

              return ListView.builder(
                itemBuilder: (ctx, i) {
                  return RichText(
                    text: textSpan[i],
                  );
                },
                itemCount: snapshot.data.items.length,
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
