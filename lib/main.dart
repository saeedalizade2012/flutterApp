import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/home/home.dart';
import 'controller/route_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:storapp/controller/widgetApp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'آنلاین شاپ',
      theme: ThemeData(
        primaryColor: KprimaryColor,
      ),
      initialRoute: '/',
    /*  routes: {
        '/': (context) => MyHomePage(title: KTextAppBar),
        '/category': (context) =>listCategory(),
        '/products': (context) =>Products(id:ModalRoute.of(context).settings.arguments)
      },*/
      onGenerateRoute: RouteGenerator.GenerateRoute,

    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetApp(body: Home(),indexCurve:2)
    );
  }
}
