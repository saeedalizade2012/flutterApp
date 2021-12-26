import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';
import 'package:html/parser.dart';
import 'package:storapp/screens/loader.dart';
import 'package:intl/intl.dart' as intl;
import 'package:storapp/controller/widgetApp.dart';
import 'package:storapp/screens/products/detailProduct.dart';

class Products extends StatefulWidget {
  final int id;

  Products({this.id});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
   List productsData = [];
  bool loading = true;
  void initState() {
    super.initState();
    getProductOfACategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);
    return SafeArea( child:
    (loading)  ? Loader()  : WidgetApp(body:  Container(
      margin: EdgeInsets.all(5.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: productsData.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        DetailProduct(  id :  productsData[index]['id'])
                    ),
                    )
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    width: width / 3,
                    height: height / 4,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5.0),
                          width: width / 3,
                          height: height / 4,
                          child: Column(
                            children: <Widget>[
                              FadeInImage(
                                height: height / 4.5,
                                width: 200.0,
                                placeholder:
                                AssetImage('images/loaderApp.gif'),
                                image: NetworkImage((productsData[index]
                                ['images'][0]['src']
                                    .toString() !=
                                    null)
                                    ? productsData[index]['images'][0]['src']
                                    .toString()
                                    : AssetImage('images/login.png')),
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.0),
                          width: width / 1.65,
                          height: height / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: width / 1.65,
                                height: height / 24,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(top: 10.0, right: 20.0),
                                  child: Text(
                                    productsData[index]['name'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily:
                                      PersianFonts.Vazir.toString(),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                    color: Colors.black12,
                                    thickness: 1.5,
                                  )),
                              Container(
                                width: width / 1.65,
                                height: height / 8,
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(top: 15.0, right: 20.0),
                                  child: Text(
                                    _parseHtmlString(productsData[index]
                                    ['short_description'])
                                        .length >
                                        50
                                        ? "${_parseHtmlString(productsData[index]['short_description']).substring(0, 49)}..."
                                        : _parseHtmlString(productsData[index]
                                    ['short_description']),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily:
                                      PersianFonts.Vazir.toString(),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "قیمت: ${intl.NumberFormat.decimalPattern().format(double.tryParse(productsData[index]['price']))} ریال "
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),indexCurve: 2)
    );
  }

  Future<List> getProductOfACategory(id) async {
    // print('products?category=${categoryId}');
    FetchDataFromWoocommerce fetchDataFromWoocommerce =
        FetchDataFromWoocommerce(endPoint: 'products?category=$id');
    productsData = await fetchDataFromWoocommerce.getSpecialProduct();
    setState(() {
      loading = false;
      return productsData;
    });
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}
