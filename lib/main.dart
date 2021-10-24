import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:storapp/screens/home/listProductWithDescription.dart';
import 'package:storapp/screens/listCategory/listCategoryProduct.dart';
import 'package:storapp/sidemenu/Menu.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/home/searchBox.dart';
import 'package:storapp/screens/home/listCategory.dart';
import 'package:storapp/screens/home/slider.dart';
import 'package:storapp/screens/home/listSpecialProduct.dart';
import 'package:storapp/screens/products/products.dart';


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
      locale: Locale("fa", "IR"),
      // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'آنلاین شاپ',
      theme: ThemeData(
        primaryColor: KprimaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'آنلاین شاپ'),
        '/category': (context) =>listCategory(),
        '/products': (context) =>Products()
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
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: KprimaryColor,
        drawer: NavDrawer(),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.red),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.red,
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(FlutterIcons.basket_sli),
                onPressed: () => Navigator.pushNamed(context, '/'),
              ),
            ),
          ],
          title: Center(child: Text(widget.title)),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.redAccent[100],
          backgroundColor: KprimaryColor,
          animationCurve: Curves.easeInOutSine,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: ListView(
          children: [
            Center(
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
                  KsizeBox,
                  listProductWithDescription(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
