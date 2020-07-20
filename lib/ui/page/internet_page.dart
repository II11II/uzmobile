import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InternetPage extends StatefulWidget {
  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  List<Tab> kTabs = [
    Tab(
      child: Text('paketi'.tr()),
    ),
    Tab(
      child: Text('night'.tr()),
    ),
    Tab(
      child: Text('night'.tr()),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("internet".tr()),
        ),
        body: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                labelColor: Colors.black,
                tabs: kTabs,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [customTab(), customTab(), customTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTab() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Text("dfsdf"),
    );
  }
}
