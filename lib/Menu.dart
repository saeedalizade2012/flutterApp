import 'package:flutter/material.dart';
import 'constant/constantCss.dart';
import 'package:persian_fonts/persian_fonts.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl ,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'فروشگاه اینترنتی شهدا',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: KTextAlignmentRight,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/images/cover.jpg'))
              ),
            ),
            ListTile(
              leading: Icon(
                  Icons.input,
              ),
              title: Text(
                'پروفایل کاربری',
                style: PersianFonts.Vazir.copyWith(
                    fontSize: 20
                ),
              ),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}
