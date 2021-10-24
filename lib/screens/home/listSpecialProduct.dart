import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:flutter_icons/flutter_icons.dart';
class SpecialProduct extends StatelessWidget {
  List<dynamic> products = [
    {
      'country': 'محصول یک',
      'city': 'Tokyo',
      'urlProduct': 'https://storage.torob.com/backend-api/base/images/dG/EJ/dGEJcHLRj5JjfmEh.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    }, {
      'country': 'محصول دو',
      'city': 'Tokyo',
      'urlProduct': 'https://storage.torob.com/backend-api/base/images/h9/g_/h9g_STh_TkXzEf9W.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول سه',
      'city': 'Tokyo',
      'urlProduct': 'https://storage.torob.com/backend-api/base/images/hl/5k/hl5k79WQO0iJUt3c.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول چهار',
      'city': 'Tokyo',
      'urlProduct': 'https://storage.torob.com/backend-api/base/images/jT/v6/jTv65wL5fTOtxvMY.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول پنج',
      'city': 'Tokyo',
      'urlProduct': 'https://storage.torob.com/backend-api/base/images/ZA/sE/ZAsEWAj4Fi5mRCuL.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: KmarginL10,
        height: 200.0,
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
                              width: 360.0,
                              height: 150.0,
                              margin: EdgeInsets.only(
                                  left: 8.0,
                                  top: 10.0,
                                  right: 8.0,
                                  bottom: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Container(
                                width: 150.0,
                                height: 150.0,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'images/loaderApp.gif',
                                        image:  products[index]['urlProduct'],
                                      ),
                                    ),
                                  )
                                ),
                                padding: EdgeInsets.only(
                                    left: 2.0,
                                    top: 2.0,
                                    right: 2.0,
                                    bottom: 2.0),

                                ),
                                Container(
                                  width: 210.0,
                                  height: 150.0,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 200.0,
                                        height: 50.0,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment : Alignment.centerRight ,
                                                child: Text(
                                                  products[index]['country'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: KTextAlignmentRight,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 200.0,
                                        height: 35.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${products[index]['Longitude'].toString()}ریال',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),

                                      ),
                                      Container(
                                        width: 200.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(left:7.0,right: 3.0,top: 5.0,bottom: 5.0),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blueGrey.withOpacity(0.1),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: Offset(0, 4), // changes position of shadow
                                            ),
                                          ],
                                        ),

                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 80.0,
                                              height: 50.0,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.shopping_basket,
                                                    color: Colors.red
                                                    ),
                                                    SizedBox(width: 5.0),
                                                    Text(
                                                   'خرید'
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 2.0,
                                            child: Text(
                                              '|',
                                              style: TextStyle(
                                                color: Colors.grey
                                              ),
                                            ),),
                                            Container(
                                              width: 110.0,
                                              height: 50.0,
                                              margin: EdgeInsets.only(right: 5.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(FontAwesome.heart,color: Colors.red),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                      'دوسش دارم'
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                )
                                ],
                              )
                          ),
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

