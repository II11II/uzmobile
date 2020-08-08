import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uzmobile/bloc/service_bloc.dart';
import 'package:uzmobile/model/service.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final bloc = ServiceBloc();

  @override
  void initState() {
    bloc.getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('services'.tr().toUpperCase()),
      ),
      body: StreamBuilder<List<Service>>(
          stream: bloc.services,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, i) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  context.locale.languageCode == "ru"
                                      ? snapshot.data[i].titleRu
                                      : snapshot.data[i].titleUz,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                              subtitle: Text(context.locale.languageCode == "ru"
                                  ? snapshot.data[i].descrRu
                                  : snapshot.data[i].descrUz),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  snapshot.data[i].codeApply != null
                                      ? FlatButton(
                                          onPressed: () async {
                                            if (await canLaunch(
                                                snapshot.data[i].codeApply)) {
                                              await launch(
                                                  snapshot.data[i].codeApply);
                                            }
                                          },
                                          child: Text(
                                            'confirm'.tr(),
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        )
                                      : Container(),
                                  snapshot.data[i].codeDeny != null
                                      ? FlatButton(
                                          onPressed: () async {
                                            if (await canLaunch(
                                                snapshot.data[i].codeDeny)) {
                                              await launch(
                                                  snapshot.data[i].codeDeny);
                                            }
                                          },
                                          child: Text(
                                            'deny'.tr(),
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        )
                                      : Container(),
                                  snapshot.data[i].codeSet != null
                                      ? FlatButton(
                                          onPressed: () async {
                                            if (await canLaunch(
                                                snapshot.data[i].codeSet)) {
                                              await launch(
                                                  snapshot.data[i].codeSet);
                                            }
                                          },
                                          child: Text(
                                            'set'.tr(),
                                            style:
                                                TextStyle(color: Colors.amber),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            else
              return Container();
          }),
    );
  }
}
