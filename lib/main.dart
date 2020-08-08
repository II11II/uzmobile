import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ru', 'RU'), Locale('uz', 'UZ')],
        path: 'assets/translations',
        fallbackLocale: Locale('uz', 'UZ'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'uzmobile'.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
