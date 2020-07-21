
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("news".tr()),),
      body: Text(''),
    );
  }
}
