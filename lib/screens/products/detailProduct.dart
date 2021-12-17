import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:storapp/screens/loader.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/menu/Menu.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';

final List<String> imgList = [
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/6f321832856a7ec2a2fcde4e4d6f2899606fd9cf_1632395144.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/83546e4ef66d4a9f8ad1b1ee16d305c20efbb0af_1632319190.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/5f37b45d530de64385a7b89d31771bbe68e85df0_1632684593.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/d0ce66f275a1267d85257c377831fc2efbe0e0ef_1632316441.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/6f321832856a7ec2a2fcde4e4d6f2899606fd9cf_1632395144.jpg?x-oss-process=image/quality,q_80',
];

class DetailProduct extends StatefulWidget {
  final int id;

  DetailProduct({this.id});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  List<Widget> imageSliders = [];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool loading = true;
  List<dynamic> images = [];
  int _current = 0;
  var getPro;
  final CarouselController _controller = CarouselController();

  void initState() {
    super.initState();
    getProduct(widget.id);
  }

  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);
    if (!loading) {
      images = getPro['images'];
      imageSliders = images
          .map((item) => Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item['src'],
                            fit: BoxFit.cover, width: width),
                      ],
                    )),
              ))
          .toList();
    }

    return SafeArea(
      child: (loading)
          ? Loader()
          : Scaffold(
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
              body: ListView(children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: height / 3.5,
                      width: width,
                      child: CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: false,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    KsizeBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10.0),
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text(
                                _parseHtmlString(getPro['description']),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: PersianFonts.Vazir.toString(),
                              ),
                                textAlign: TextAlign.start
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ]),
            ),
    );
  }

  Future<dynamic> getProduct(id) async {
    FetchDataFromWoocommerce fetchDataFromWoocommerce =
        FetchDataFromWoocommerce(endPoint: 'products/$id');
    getPro = await fetchDataFromWoocommerce.getProductInfo();
    setState(() {
      loading = false;
      return getPro;
    });
  }
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}
