import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storapp/constant/constantCss.dart';

class listProductWithDescription extends StatelessWidget {
  List<dynamic> products = [
    {
      'country': 'محصول یک',
      'city': 'Tokyo',
      'urlProduct':
          'https://storage.torob.com/backend-api/base/images/dG/EJ/dGEJcHLRj5JjfmEh.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول دو',
      'city': 'Tokyo',
      'urlProduct':
          'https://storage.torob.com/backend-api/base/images/h9/g_/h9g_STh_TkXzEf9W.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول سه',
      'city': 'Tokyo',
      'urlProduct':
          'https://storage.torob.com/backend-api/base/images/hl/5k/hl5k79WQO0iJUt3c.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول چهار',
      'city': 'Tokyo',
      'urlProduct':
          'https://storage.torob.com/backend-api/base/images/jT/v6/jTv65wL5fTOtxvMY.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'محصول پنج',
      'city': 'Tokyo',
      'urlProduct':
          'https://storage.torob.com/backend-api/base/images/ZA/sE/ZAsEWAj4Fi5mRCuL.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: KmarginL10,
        height: 280.0,
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
                              width: 250.0,
                              height: 260.0,
                              margin: EdgeInsets.only(
                                  left: 8.0, top: 0.0, right: 8.0, bottom: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 250.0,
                                    height: 200.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            child: Padding(
                                              padding:  EdgeInsets.all(8.0),
                                              child: Center(
                                                child: ClipRRect(
                                                  child: FadeInImage.assetNetwork(
                                                    placeholder:
                                                        'images/loaderApp.gif',
                                                    image: products[index]
                                                        ['urlProduct'],
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 35.0,
                                            height: 55.0,
                                            margin: EdgeInsets.only(right: 15.0) ,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200].withOpacity(0.7),
                                            ),
                                            child: Icon(
                                                Icons.favorite,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 210.0,
                                    height: 50.0,
                                    child: Column(
                                      children: <Widget>[
                                        Center(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding:  EdgeInsets.all(8.0),
                                              child: Text(
                                                products[index]['country']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ),
                                                textAlign: KTextAlignmentRight,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
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
