import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';
class SpecialProduct extends StatefulWidget {
  @override
  _SpecialProductState createState() => _SpecialProductState();

}

class _SpecialProductState extends State<SpecialProduct> {
  List specialProduct = [] ;
  void initState() {
    super.initState();
    getSpecialProduct();
  }
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
                itemCount: specialProduct.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                              width: 380.0,
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
                                              image: specialProduct[index]['images'][0]['src'].toString(),
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
                                    width: 230.0,
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
                                                    specialProduct[index]['name'].toString(),
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
                                                (specialProduct[index]['sale_price']!="") ? '${specialProduct[index]['sale_price'].toString()}ریال' :
                                              '${specialProduct[index]['regular_price'].toString()}ریال',
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

  Future<List> getSpecialProduct() async{
    FetchDataFromWoocommerce fetchDataFromWoocommerce = FetchDataFromWoocommerce(endPoint: "products?featured=true");
    specialProduct = await fetchDataFromWoocommerce.getSpecialProduct();
    setState(() {
      return specialProduct ;
    });

  }
}



