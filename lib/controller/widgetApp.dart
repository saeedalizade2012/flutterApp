import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/main.dart';
import 'package:storapp/screens/listCategory/listCategoryProduct.dart';
import 'package:storapp/screens/search.dart';
import 'package:storapp/screens/home/home.dart';
import 'package:storapp/screens/signIn/loginIn.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:storapp/screens/menu/Menu.dart';
import 'package:storapp/constant/constantCss.dart';

class WidgetApp extends StatefulWidget {

  final Widget body;

  final int indexCurve;

  WidgetApp({this.body, this.indexCurve});

  @override
  _WidgetAppState createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KprimaryColor,
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: KprimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: KColorText),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: KColorText,
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(FlutterIcons.basket_sli),
                    onPressed: () => Navigator.pop(context),
                  ),
            ),
          ],
          title: Center(
              child: Text(
                'آنلاین شاپ',
                style: TextStyle(
                    color: KColorText,
                    fontFamily: PersianFonts.Vazir.toString(),
                    fontSize: 24
                ),
              )
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: widget.indexCurve,
          height: 60.0,
          items: <Widget>[
            IconButton(
              icon: Icon(Icons.search, size: 30),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        Search()
                    )
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.table_chart, size: 30),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        listCategory()
                    )
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home, size: 30),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        MyHomePage(title: 'آنلاین شاپ',)
                    )
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.perm_identity, size: 30),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        LoginScreen()
                    )
                );
              },
            ),

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
        body: widget.body
    );
  }
}
