import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:uzmobile/bloc/internet_bloc.dart';
import 'package:uzmobile/model/all.dart';
import 'package:uzmobile/ui/widget/balance_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InternetPage extends StatefulWidget {
  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  final bloc = InternetBloc();
  List<Tab> kTabs = [
    Tab(
      child: Text('paketi'.tr().toUpperCase()),
    ),
    Tab(
      child: Text('non-stop'.toUpperCase()),
    ),
    Tab(
      child: Text('perDay'.tr().toUpperCase()),
    )
  ];

  @override
  void initState() {
    bloc.getInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("internet".tr().toUpperCase()),
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
              child: IndexedStack(children: [
                TabBarView(
                  children: [
                    StreamBuilder<Object>(
                        stream: bloc.paketi,
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return customTab(
                                snapshot.data, bloc.showButtonsPaketi);
                          else
                            return Container();
                        }),
                    StreamBuilder<Object>(
                        stream: bloc.night,
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return customTab(
                                snapshot.data, bloc.showButtonsNight);
                          else
                            return Container();
                        }),
                    StreamBuilder<Object>(
                        stream: bloc.onnet,
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return customTab(
                                snapshot.data, bloc.showButtonsOnnet);
                          else
                            return Container();
                        }),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTab(List<Ism> data, showButtons) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (data[index].catUz != null && data[index].catUz != '')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          context.locale.languageCode == 'ru'
                              ? data[index].catRu
                              : data[index].catUz,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        Divider()
                      ],
                    )
                  else
                    Container(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          showButtons[index].value = !showButtons[index].value;
                        },
                        leading: Text(data[index].titleRu),
                        trailing: Text(
                          data[index].price,
                          style: TextStyle(color: Colors.indigo.shade900),
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: showButtons[index],
                          builder: (ctx, v, w) {
                            if (v)
                              return Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showButtons[index].value =
                                            !showButtons[index].value;
                                      },
                                      child: Container(
                                        child: Text(
                                            context.locale.languageCode == 'ru'
                                                ? data[index]
                                                    .descRu
                                                    .replaceAll('<br>', '\n')
                                                : data[index]
                                                    .descUz
                                                    .replaceAll('<br>', '\n')),
                                      ),
                                    ),
                                    BalanceButton(
                                      title: "buy".tr().toUpperCase(),
                                      onPressed: () async {
                                        String urlString =
                                            'tel:${data[index].kod+"#"}';
                                        if (await canLaunch(urlString)) {
                                          await 
                                           FlutterPhoneDirectCaller
                                              .callNumber(urlString);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              );
                            else
                              return Container();
                          })
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
