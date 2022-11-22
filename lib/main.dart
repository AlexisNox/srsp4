import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srs4/language_page.dart';
import 'package:srs4/login_page.dart';
import 'package:srs4/registra_page.dart';
import 'package:srs4/bottom_bar.dart';
import 'package:srs4/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('kk'),
        Locale('ru'),
        Locale('en')
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('ru'),
      assetLoader: CodegenLoader(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LanguagePage (),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}