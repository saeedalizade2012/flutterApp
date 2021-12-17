import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:storapp/main.dart';

class SaneAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                MyHomePage(  title : 'آنلاین شاپ')
            ),
            )
          ),
        ),
      ],
      title: Center(child: Text('آنلاین شاپ')),
    );
  }
}