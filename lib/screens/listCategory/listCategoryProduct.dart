import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/menu/Menu.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';


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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var width = size.size.width;
    var height = size.size.height;
    var percentSize = (width / height) / 1.1;
    return SafeArea(
        child: Scaffold(
            extendBody: true,
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
                  builder: (context) =>
                      IconButton(
                        icon: Icon(FlutterIcons.basket_sli),
                        onPressed: () => Navigator.pushNamed(context, '/'),
                      ),
                ),
              ],
              title: Center(child: Text(KTextAppBar)),
            ),

            body : LayoutBuilder(
            builder: (context, constraints) =>
        GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: countBoxShow(),
        childAspectRatio: percentSize * aspectRatio(percentSize),
        children: List.generate(categoriesData.length, (index) =>
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () =>
                {
                },
                child: Card(
                  child: Container(
                    height: width / 3,
                    width: 200.0,
                    child: Column(
                      children: [
                        FadeInImage(
                          height: 200.0,
                          width: 200.0,
                          placeholder: AssetImage('images/loaderApp.gif'),
                          image: NetworkImage( (categoriesData[index]['image']['src'].toString() != null) ?
                          categoriesData[index]['image']['src'].toString() : AssetImage('images/login.png')),
                          fit: BoxFit.cover,
                        ),
                        Text(categoriesData[index]['name']),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ).toList()
    ),),

    )
    ,
    );

  }


  Future<List> getCategoriesOfClass() async{
    FetchDataFromWoocommerce fetchDataFromWoocommerce = FetchDataFromWoocommerce(endPoint: "products/categories");
    categoriesData = await fetchDataFromWoocommerce.getCategories();
    setState(() {
      return categoriesData ;
    });
  }

  int countBoxShow() {
    var size = MediaQuery
        .of(context)
        .size
        .width;
    var isPortrait = MediaQuery
        .of(context)
        .orientation;
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
    var isPortrait = MediaQuery
        .of(context)
        .orientation;

    if (isPortrait == Orientation.portrait) {
      print('portrait');
      if (percentSize < 0.5) {
        return 1.4;
      } else if (percentSize > 0.5) {
        return 1.6;
      }
    } else if (isPortrait == Orientation.landscape) {
      print('landscape');
      return 0.5;
    }
  }


}



