import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/main.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/controller/widgetApp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:storapp/controller/User.dart';
import 'dart:convert';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _storage = FlutterSecureStorage();

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    print(_read());
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'کاربری با این مشخصات وجود ندارد';
      }
      if (users[data.name] != data.password) {
        return 'کلمه عبور اشتباه است';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'کاربر وجود ندارد';
      }
      return null;
    });
  }
  Future<String> _signupUser(LoginData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    User user = User(email: data.name,password: data.password);
    return Future.delayed(loginTime).then((_) {
       _save(user, 'infoUser');
       return 'ثبت نام با موفقیت انجام شد' ;
    });
  }
  Future<String> _read() async {
    final user = await _storage.read(key: 'infoUser');
    if (user?.isNotEmpty ?? false) {
      return user;
    }
    return null;
  }

  Future _save(User user,String keyName) async {
    await _storage.write(key: keyName, value: json.encode(user.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetApp(
          body: FlutterLogin(
              title: KTextAppBar,
              logo: 'images/login.png',
              onLogin: _authUser,
              onSignup: _signupUser,
              onSubmitAnimationCompleted: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyHomePage(title: KTextAppBar),
                ));
              },
              onRecoverPassword: _recoverPassword,
              theme: LoginTheme(
                logoWidth: 1 ,
                switchAuthTextColor : Colors.redAccent ,
                primaryColor: KprimaryColor,
                accentColor: Colors.yellow,
                errorColor: Colors.deepOrange,
                titleStyle: TextStyle(
                  color: KColorText,
                  fontFamily: PersianFonts.Vazir.toString(),
                  letterSpacing: 1,
                ),
                textFieldStyle: TextStyle(
                  color: KColorText,
                  shadows: [Shadow(color: KColorText, blurRadius: 2)],
                ),
                buttonTheme:
                    LoginButtonTheme(
                        backgroundColor: Colors.redAccent
                    ),
              ),
              messages: LoginMessages(
                  signupButton : 'ثبت نام'
              )),
          indexCurve: 3),
    );
  }
}
