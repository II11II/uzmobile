import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/

import 'package:flutter/material.dart';
import 'package:mobiuz/bloc/minute_sms_bloc.dart';
import 'package:mobiuz/model/all.dart';
import 'package:mobiuz/ui/widget/balance_button.dart';

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
        title: Text("minute_sms".tr()),
      ),
      body: StreamBuilder<List<Ism>>(
          stream: bloc.minuteSms,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            bloc.showButtons[index].value =
                                !bloc.showButtons[index].value;
                          },
                          leading: Text(snapshot.data[index].titleRu),
                          trailing: Text(
                            snapshot.data[index].price,
                            style: TextStyle(color: Colors.indigo.shade900),
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
                                              !bloc.showButtons[index].value;
                                        },
                                        child: Container(
                                          child:
                                              Text(snapshot.data[index].descRu),
//                                            parse(parse(data.description).body.text).documentElement.text
                                        ),
                                      ),
                                      BalanceButton(
                                        title: "buy".tr(),
                                      )
                                    ],
                                  ),
                                );
                              else
                                return Container();
                            })
                      ],
                    );
                  });
            else {
              return Container();
            }
          }),
    );
  }
}
