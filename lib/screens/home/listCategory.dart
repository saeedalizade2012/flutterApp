import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/constant/ResponsiveDevice.dart';
import 'package:storapp/controller/fetchDataFromWoocommerce.dart';
import 'package:storapp/screens/products/products.dart';
class ListCategoryHome extends StatefulWidget {
  @override
  _ListCategoryHomeState createState() => _ListCategoryHomeState();
}

class _ListCategoryHomeState extends State<ListCategoryHome> {
  List categoriesData = [];
  void initState() {
    super.initState();
    getCategoriesOfClass();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        margin: KmarginL10,
        height: 120.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesData.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                              Products(  id :  categoriesData[index]['id'])
                          ),
                          )
                        },
                        child: Column(
                          children: <Widget>[
                            ResponsiveDevice(
                                mobile: buildContainer('Column',categoriesData[index]['image']['src'].toString()),
                                tablet: buildContainer('Row',categoriesData[index]['image']['src'].toString())
                            ),
                            Text(
                              categoriesData[index]['name'],
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: PersianFonts.Vazir.toString(),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ));


  }

  Future<List> getCategoriesOfClass() async{
    FetchDataFromWoocommerce fetchDataFromWoocommerce = FetchDataFromWoocommerce(endPoint: "products/categories");
  categoriesData = await fetchDataFromWoocommerce.getCategories();
    setState(() {
      return categoriesData ;
    });

  }
  Container buildContainer(String typeDevice,String linkImage) {
    var right = (typeDevice =='Column') ? 8.0 : 30.0;
    var left = (typeDevice =='Column') ? 8.0 : 32.0;
    var top = (typeDevice =='Column') ? 10.0 : 10.0;
    var bottom = (typeDevice =='Column') ? 10.0 : 10.0;
    return Container(
      width: 70.0,
      height: 70.0,
      margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: FadeInImage(
        height: 200.0,
        width: 200.0,
        placeholder: AssetImage('images/loaderApp.gif'),
        image: NetworkImage((linkImage != null) ?  linkImage : AssetImage('images/login.png')),
        fit: BoxFit.cover,
      ),
    );
  }

}
