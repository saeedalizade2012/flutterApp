import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/constant/constantCss.dart';

class ListCategory extends StatelessWidget {
  final List<String> products = [
    "دسته بندی 1",
    "دسته بندی 2",
    "دسته بندی 3",
    "دسته بندی 4",
    "دسته بندی 5",
    "دسته بندی 6",
    "دسته بندی 7"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: KmarginL10,
        height: 120.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            width: 70.0,
                            height: 70.0,
                            margin: EdgeInsets.only(
                                left: 8.0, top: 10.0, right: 8.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.grey[600],
                                ),
                          ),
                          Text(
                            products[index],
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: PersianFonts.Vazir.toString(),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
