import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';
import 'package:storapp/screens/loader.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/screens/products/products.dart';
import 'package:storapp/controller/widgetApp.dart';

class listCategory extends StatefulWidget {
  @override
  _listCategoryState createState() => _listCategoryState();
}

class _listCategoryState extends State<listCategory> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List categories = [];
  List categoriesData = [];

  @override
  void initState() {
    super.initState();
    getCategoriesOfClass();
  }

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var width = size.size.width;
    var height = size.size.height;
    var percentSize = (width / height) / 1.1;
    return SafeArea(
      child: loading  ? Loader()  : WidgetApp(
        body: LayoutBuilder(
        builder: (context, constraints) => GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: countBoxShow(),
            childAspectRatio: percentSize * aspectRatio(percentSize),
            children: List.generate(
              categoriesData.length,
                  (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () =>
                  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        Products(  id :  categoriesData[index]['id'])
                    ),
                    )
                  },
                  child: Card(
                    child: Container(
                      height: height / 3,
                      width: width / 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: FadeInImage(
                              height: 200.0,
                              width: 200.0,
                              placeholder:
                              AssetImage('images/loaderApp.gif'),
                              image: NetworkImage((categoriesData[index]['image']['src'].toString() !=  null)
                                  ? categoriesData[index]['image']['src']
                                  .toString()
                                  : AssetImage('images/login.png')),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: width / 8,
                            width: width / 2,
                            child: Center(
                              child: Text(
                                categoriesData[index]['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: PersianFonts.Vazir.toString(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: width / 8,
                            width: width / 2,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                            ),
                            child: Center(
                              child: Text(
                               '${categoriesData[index]['count'].toString()} محصول',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: PersianFonts.Vazir.toString(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ).toList()),
      ),indexCurve: 1,)
    );
  }

  Future<List> getCategoriesOfClass() async {
    FetchDataFromWoocommerce fetchDataFromWoocommerce =
        FetchDataFromWoocommerce(endPoint: "products/categories");
    categoriesData = await fetchDataFromWoocommerce.getCategories();
    setState(() {
      loading = false;
      return categoriesData;
    });
  }

  int countBoxShow() {
    var size = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation;
    if (size < 768 && isPortrait == Orientation.portrait) {
      print('portrait');
      return 2;
    } else if (size < 768 && isPortrait == Orientation.landscape) {
      print('landscape');
      return 3;
    } else {
      print('else');
      return 3;
    }
    // print(size);
    //  return (size.width < 768) ? 2 : 3 ;
  }

  double aspectRatio(percentSize) {
    var isPortrait = MediaQuery.of(context).orientation;

    if (isPortrait == Orientation.portrait) {
      print('portrait');
      if (percentSize < 0.5) {
        return 1.45;
      } else if (percentSize > 0.5) {
        return 1.6;
      }
    } else if (isPortrait == Orientation.landscape) {
      print('landscape');
      return 0.5;
    }
  }
}
