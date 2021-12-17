import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/menu/Menu.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';
import 'package:html/parser.dart';
import 'package:storapp/screens/loader.dart';
import 'package:intl/intl.dart' as intl;
import 'package:storapp/screens/products/detailProduct.dart';

class Products extends StatefulWidget {
  final int id;

  Products({this.id});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
    (loading)  ? Loader()  :
      Scaffold(
        backgroundColor: KprimaryColor,
        drawer: NavDrawer(),
        appBar: AppBar(
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
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
          title: Center(child: Text('آنلاین شاپ')),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.redAccent[100],
          backgroundColor: KprimaryColor,
          animationCurve: Curves.easeInOutSine,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
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
        ),
      ),
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
