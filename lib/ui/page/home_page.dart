/*
    @Authour: Islomkuja Akhrorov
    Created at: 7/13/20
*/
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:uzmobile/bloc/home_bloc.dart';
import 'package:uzmobile/ui/page/balance_page.dart';
import 'package:uzmobile/ui/page/internet_page.dart';
import 'package:uzmobile/ui/page/minute_sms_page.dart';
import 'package:uzmobile/ui/page/news_page.dart';
import 'package:uzmobile/ui/page/rate_page.dart';
import 'package:uzmobile/ui/page/service_page.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    bloc.getData().then((value) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(value.tr()),
        duration: Duration(milliseconds: 700),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        bottomNavigationBar: bottomNavigationBar(),
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('uzmobile'.tr()),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/icon/icon.png',
                            scale: 20,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'national_operator'.tr(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  )),
              Expanded(
                child: GridView.count(
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    crossAxisCount: 2,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        BalancePage())),
                            child: Card(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 3,
                              child: Image.asset(
                                'assets/icon/balans.png',
                                color: Colors.white,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text('balance'.tr().toUpperCase())
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        InternetPage())),
                            child: Card(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 3,
                              child: Image.asset(
                                'assets/icon/internet.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text('internet'.tr().toUpperCase())
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => RatePage())),
                            child: Card(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 3,
                              child: Image.asset(
                                'assets/icon/tarifi.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text('rates'.tr().toUpperCase())
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        ServicePage())),
                            child: Card(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 3,
                              child: Image.asset(
                                'assets/icon/uslugi.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text('services'.tr().toUpperCase())
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        MinuteSmsPage())),
                            child: Card(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 3,
                              child: Image.asset(
                                'assets/icon/minuti.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text('minute_sms'.tr().toUpperCase())
                        ],
                      ),
                      Column(
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        NewsPage())),
                            child: Card(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 3,
                              child: Image.asset(
                                'assets/icon/news.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text('news'.tr().toUpperCase())
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text('call_center'.tr().toUpperCase())),
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text('home'.tr().toUpperCase())),
        BottomNavigationBarItem(
          icon: Icon(Icons.sim_card),
          title: Text('cabinet'.tr().toUpperCase()),
        ),
      ],
      currentIndex: 1,
      onTap: (index) async {
        if (index == 0) {
          String codeNumber = 'tel:1099';
          if (await canLaunch(codeNumber)) {
            await FlutterPhoneDirectCaller.callNumber(codeNumber);
          }
        }
        if (index == 2) {
          String urlString = "https://cabinet.uztelecom.uz/ps/scc/login.php";
          if (await canLaunch(urlString))
            await launch(urlString);
        }
      },
      selectedItemColor: Theme.of(context).primaryColor,
    );
  }

  drawer() {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Text(
              "more".tr(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey.shade700),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('russian'.tr()),
            onTap: () {
              context.locale = Locale('ru', 'RU');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('uzbek'.tr()),
            onTap: () {
              context.locale = Locale('uz', 'UZ');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('share'.tr()),
            onTap: () {
              if (Platform.isIOS)
                Share.share(''); // TODO : APP Store link
              else {
                Share.share('');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text('telegram_channel'.tr()),
            onTap: () async {
              String telegram = 'https://t.me/USSDMobileUzb';
              if (await canLaunch(telegram)) {
                await launch(telegram);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('rate_app'.tr()),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
