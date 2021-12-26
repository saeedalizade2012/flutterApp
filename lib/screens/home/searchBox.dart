import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/constant/constantCss.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(50),
          child: TextFormField(
            textAlign: KTextAlignmentRight,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              prefixIcon: Icon(Icons.search,
              color: Colors.grey
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              hintText: 'دنبال چه هستید',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
                fontFamily: PersianFonts.Vazir.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
* textAlign: KTextAlignmentRight,
                obscureText: true,
                autofocus: true,
                decoration: InputDecoration(
                    icon:  Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Icon(
                          Icons.search,
                          color: Color(0xFF0B2255)
                      ),
                    ),
                    hintText: 'دنبال چه هستید',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontFamily: PersianFonts.Vazir.toString(),
                  ),
*
* */
