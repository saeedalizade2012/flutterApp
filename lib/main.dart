import 'package:flutter/material.dart';
import 'package:storapp/sidemenu/Menu.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/home/searchBox.dart';
import 'package:storapp/screens/home/listCategory.dart';
import 'package:storapp/screens/home/slider.dart';
import 'package:storapp/screens/home/listSpecialProduct.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
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
      locale: Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'آنلاین شاپ',
      theme: ThemeData(
          primaryColor : KprimaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=> MyHomePage(title: 'آنلاین شاپ'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.red
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.red,
              icon:  Icon(
                  Icons.menu
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
        Builder(
            builder: (context)=> IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () =>  Navigator.pushNamed(context, '/'),

              ),
          ),
        ],
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SearchBox(),
            KsizeBox,
            ListCategory(),
            KsizeBox,
            SliderHome(),
            KsizeBox,
            SpecialProduct(),


          ],
        ),
      ),
    );
  }
}
