import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
showAlert(BuildContext context, String title, Function onConfirm,
    {String confirmButton}) async {
  await showDialog(
      context: context,
      child: AlertDialog(
        title: Text(title),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("cancel".tr()),
          ),
          FlatButton(
            onPressed: onConfirm,
            child: Text(confirmButton ?? "confirm".tr()),
          ),
        ],
      ));
}
