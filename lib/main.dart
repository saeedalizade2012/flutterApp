import 'package:flutter/material.dart';
import 'package:storapp/Menu.dart';
import 'constant/constantCss.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/' : (context)=> MyHomePage(title: 'فروشگاه اینترنتی شهدا'),
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
      endDrawer: NavDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
         /* IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
          ),*/
        ],
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
        ),
      ),
    );
  }
}
