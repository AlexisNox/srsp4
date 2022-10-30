import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:srs4/profile_page.dart';
import 'package:srs4/translations/locale_keys.g.dart';
import 'package:srs4/new_page.dart';
import 'package:srs4/map_page.dart';
import 'package:srs4/qr_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.welcome.tr(),
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const MapPage(),
    const NewPage(),
    const QrPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          LocaleKeys.welcome.tr(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapPage(),
                    ));
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),


          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(),
                  ));
            });
              },
            icon: pageIndex == 1
                ? const Icon(
              Icons.newspaper_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.newspaper_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),


          IconButton(
            enableFeedback: false,
            onPressed: ()  {
              setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrPage(),
                  ));
            });
              },

            icon: pageIndex == 2
                ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.widgets_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),


          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              });
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}