import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:storapp/screens/listCategory/listCategoryProduct.dart';
import 'package:storapp/screens/menu/Menu.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/home/home.dart';
import 'package:storapp/screens/menu/profile.dart';
import 'package:storapp/screens/signIn/loginIn.dart';
import 'controller/route_generator.dart';



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
  final List<Widget> _tabItems = [Home(), listCategory(),Home(), ProfileUser(),LoginScreen()];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
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
                onPressed: () => Navigator.pushNamed(context, '/',arguments: MyHomePage(title: 'شاپ آنلاین')),
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
        body: _tabItems[_page],
      ),
    );
  }
}
