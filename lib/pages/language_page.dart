import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srs4/ofor/header_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srs4/login_registra/login_page.dart';
import 'package:srs4/user.dart';
import 'package:lottie/lottie.dart';

import '../bloc/app_bloc.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late AppBloc appBloc;
  double _headerHeight = 250;
  bool _hidepassword = true;
  User newUser = User();

  @override
  void initState() {
    appBloc = AppBloc();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        minimumSize: const Size(150, 70),
        primary: Colors.purple,
        textStyle: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400));
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            height: _headerHeight,
              child: Lottie.asset(
                  'assets/lottie/40448-select-your-language.json')
            ),
          SafeArea(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(usersInfo: newUser),
                        ),
                      );
                      await context.setLocale(Locale('ru'));
                      appBloc.add(AppStartedEvent());
                    },
                    child: Text(
                      "Русский",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat'),
                    )),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(usersInfo: newUser),
                        ),
                      );
                      await context.setLocale(Locale('kk'));
                      appBloc.add(AppStartedEvent());
                    },
                    child: Text(
                      "Қазақша",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat'),
                    )),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(usersInfo: newUser),
                        ),
                      );
                      await context.setLocale(Locale('en'));
                      appBloc.add(AppStartedEvent());
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat'),
                    )),
              ],
            )),
          ),
        ]),
      ),
    );
  }
}
