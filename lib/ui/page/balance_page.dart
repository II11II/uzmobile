import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:uzmobile/ui/widget/balance_button.dart';
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
        title: Text('balance'.tr().toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BalanceButton(
                title: "check_balance".tr().toUpperCase(),
                onPressed: () async {
                  String urlString = "tel:*100*1#";
                  if (await canLaunch(urlString))
                    await FlutterPhoneDirectCaller.callNumber(urlString);
                },
              ),
              BalanceButton(
                title: "check_internet_minute_sms".tr().toUpperCase(),
                onPressed: () async {
                  String urlString = "tel:*100*2#";
                  if (await canLaunch(urlString))
                    await FlutterPhoneDirectCaller.callNumber(urlString);
                },
              ),
              BalanceButton(
                title: "check_limit".tr().toUpperCase(),
                onPressed: () async {
                  String urlString = "tel:*107#";
                  if (await canLaunch(urlString))
                    await FlutterPhoneDirectCaller.callNumber(urlString);
                },
              ),
              BalanceButton(
                title: "my_number".tr().toUpperCase(),
                onPressed: () async {
                  String urlString = "tel:*100*4#";
                  if (await canLaunch(urlString))
                    await FlutterPhoneDirectCaller.callNumber(urlString);
                },
              ),
              BalanceButton(
                title: "my_numbers".tr().toUpperCase(),
                onPressed: () async {
                  String urlString = "tel:*100*5#";
                  if (await canLaunch(urlString))
                    await FlutterPhoneDirectCaller.callNumber(urlString);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
