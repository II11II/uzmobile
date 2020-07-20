import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:flutter/material.dart';
import 'package:mobiuz/ui/widget/balance_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BalancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('balance'.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BalanceButton(
                title: "check_balance".tr(),
                onPressed: () async {
                  String urlString = "tel://*100#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "check_internet_paket".tr(),
                onPressed: () async {
                  String urlString = "tel://*102#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "check_sms_left".tr(),
                onPressed: () async {
                  String urlString = "tel://*104#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "check_minute_left".tr(),
                onPressed: () async {
                  String urlString = "tel://*103#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "my_expenses".tr(),
                onPressed: () async {
                  String urlString = "tel://*111*025#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "prohibit_distribution".tr(),
                onPressed: () async {
                  String urlString = "tel://*111*0271#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "inline_services".tr(),
                onPressed: () async {
                  String urlString = "tel://*140#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "my_number".tr(),
                onPressed: () async {
                  String urlString = "tel://*150#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
              BalanceButton(
                title: "all_my_numbers".tr(),
                onPressed: () async {
                  String urlString = "tel://*151#";
                  if (await canLaunch(urlString)) launch(urlString);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
