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
import 'package:storapp/controller/widgetApp.dart';

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
      child: (loading) ? Loader() : WidgetApp(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      child: Image.network(images[entry.key]['src']),
                    ));
              }).toList(),
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
      ]), indexCurve: 2)
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
