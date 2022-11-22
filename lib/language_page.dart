import 'dart:developer';
import 'package:srs4/header_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srs4/login_page.dart';
import 'package:srs4/user.dart';


class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  double _headerHeight = 250;
  bool _hidepassword = true;
  User newUser = User();
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        minimumSize: const Size(150, 70),
        primary: Colors.purple,
        textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)
    );
    return Scaffold(
      body: Center(
        child: Column(
            children: [
            Container(
            height: _headerHeight,
            child: HeaderWidget(_headerHeight, true,
                Icons.language_outlined), //let's create a common header widget
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
                    },
                    child: Text("Русский", style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),)),
                SizedBox(height: 40,),

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
                      },
                    child: Text("Қазақша", style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),)),
                SizedBox(height: 40,),
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
                    },
                    child: Text("English", style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),)),
              ],
            )),

      ),
    ]
      ),

    ),
    );
  }
}