import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/sideMenu/Menu.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<dynamic> categories = [
    {
      'country': 'دسته بندی شماره یک',
      'city': 'Tokyo',
      'urlProduct':
      'https://storage.torob.com/backend-api/base/images/jT/v6/jTv65wL5fTOtxvMY.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'دسته بندی شماره  دو',
      'city': 'Tokyo',
      'urlProduct':
      'https://dkstatics-public.digikala.com/digikala-products/d524a8962e8ca16e4da476fd36b680f31daf1251_1602753417.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'دسته بندی شماره سه',
      'city': 'Tokyo',
      'urlProduct':
      'https://dkstatics-public.digikala.com/digikala-products/4957bf7ddb907da26b3884e32cdf35794f61546d_1610466735.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'دسته بندی شماره چهار',
      'city': 'Tokyo',
      'urlProduct':'https://dkstatics-public.digikala.com/digikala-products/ec40bd2c67680f031e3b7efcf99b8ab6f1ee9763_1615966104.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_90',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'دسته بندی شماره پنج',
      'city': 'Tokyo',
      'urlProduct':
      'https://storage.torob.com/backend-api/base/images/ZA/sE/ZAsEWAj4Fi5mRCuL.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    },
    {
      'country': 'دسته بندی شماره شش',
      'city': 'Tokyo',
      'urlProduct':
      'https://storage.torob.com/backend-api/base/images/jT/v6/jTv65wL5fTOtxvMY.jpg',
      'Longitude': 139.6503,
      'utcOffset': 9
    }
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
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
            itemCount: categories.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth/itemHeight)*1.3,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(categories.length, (index) {
                  return Column(
                    children: <Widget>[
                      Container(
                          width: 250.0,
                          height: 300.0,
                          margin: EdgeInsets.only(
                              left: 8.0, top: 10.0, right: 8.0, bottom: 0.0),
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
                                        margin: EdgeInsets.only(
                                            left: 8.0, top: 10.0, right: 8.0, bottom: 0.0),
                                        child: Center(
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'images/loaderApp.gif',
                                            image: categories[index]['urlProduct'],
                                          ),
                                        )),

                                  ],
                                ),
                              ),
                              Container(
                                width: 250.0,
                                height: 100.0,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            categories[index]['country'].toString(),
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                            ),
                                            textAlign: KTextAlignmentRight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            child: Container(
                                              decoration:  BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xFFFC9E85),
                                                    Color(0xFFEA573D),
                                                    Color(0xFFFF2B20),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.fromHeight(20.0),
                                              padding:  EdgeInsets.only(left:8.0,right:8.0),
                                              primary: Colors.white,
                                              textStyle:  TextStyle(fontSize: 20),

                                            ),
                                            onPressed: () {

                                            },
                                            child:  Text('مشاهده'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
