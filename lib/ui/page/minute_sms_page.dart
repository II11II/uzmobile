import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:uzmobile/bloc/minute_sms_bloc.dart';
import 'package:uzmobile/model/all.dart';
import 'package:uzmobile/ui/widget/balance_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MinuteSmsPage extends StatefulWidget {
  @override
  _MinuteSmsPageState createState() => _MinuteSmsPageState();
}

class _MinuteSmsPageState extends State<MinuteSmsPage> {
  final bloc = MinuteSmsBloc();

  @override
  void initState() {
    bloc.getMinuteSms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("minute_sms".tr().toUpperCase()),
      ),
      body: StreamBuilder<All>(
          stream: bloc.minuteSms,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                    itemCount: snapshot.data.ism.length,
                    itemBuilder: (context, index) {
                      bloc.prev = bloc.curr;
                      bloc.curr = snapshot.data.ism[index].catid;

                      if (bloc.prev != bloc.curr) bloc.i += 1;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (bloc.prev != bloc.curr)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  context.locale.languageCode == 'ru'
                                      ? snapshot.data.category[bloc.i].catRu
                                      : snapshot.data.category[bloc.i].catUz,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: BalanceButton(
                                    title: "check_balance".tr(),
                                    onPressed: () async {
                                      await FlutterPhoneDirectCaller.callNumber(
                                          snapshot.data.category[bloc.i].kod + "#");
                                    },
                                  ),
                                )
                              ],
                            )
                          else
                            Container(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () {
                                  bloc.showButtons[index].value =
                                      !bloc.showButtons[index].value;
                                },
                                leading: Text(
                                    context.locale.languageCode == 'ru'
                                        ? snapshot.data.ism[index].titleRu
                                        : snapshot.data.ism[index].titleUz),
                                trailing: Text(
                                  snapshot.data.ism[index].price,
                                  style:
                                      TextStyle(color: Colors.indigo.shade900),
                                ),
                              ),
                              ValueListenableBuilder(
                                  valueListenable: bloc.showButtons[index],
                                  builder: (ctx, v, w) {
                                    if (v)
                                      return Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                bloc.showButtons[index].value =
                                                    !bloc.showButtons[index]
                                                        .value;
                                              },
                                              child: Container(
                                                child: Text(context.locale
                                                            .languageCode ==
                                                        'ru'
                                                    ? snapshot
                                                        .data.ism[index].descRu
                                                        .replaceAll(
                                                            '<br>', '\n')
                                                    : snapshot
                                                        .data.ism[index].descUz
                                                        .replaceAll(
                                                            '<br>', '\n')),
                                              ),
                                            ),
                                            BalanceButton(
                                              title: "buy".tr().toUpperCase(),
                                              onPressed: () async {
                                                String urlString =
                                                    'tel:${snapshot.data.ism[index].kod.contains('#', snapshot.data.ism[index].kod.length - 1) ? snapshot.data.ism[index].kod : snapshot.data.ism[index].kod + "#"}';
                                                if (await canLaunch(
                                                    urlString)) {
                                                  await FlutterPhoneDirectCaller
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
              );
            else {
              return Container();
            }
          }),
    );
  }
}
