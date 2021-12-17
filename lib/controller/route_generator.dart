import 'package:flutter/material.dart';
import 'package:storapp/main.dart';
import 'package:storapp/constant/constantCss.dart';
import 'package:storapp/screens/listCategory/listCategoryProduct.dart';
import 'package:storapp/screens/products/products.dart';
import 'package:storapp/screens/products/detailProduct.dart';

class RouteGenerator{
  static Route<dynamic> GenerateRoute(RouteSettings settings){

    final args = settings.arguments ;

    switch(settings.name)
    {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: KTextAppBar));
        break;
      case '/category':
        return MaterialPageRoute(builder: (_)=>listCategory());
        break;
      case '/products':
       if(args is int){
          return MaterialPageRoute(builder: (_)=>
              Products(id: args));
       }
       return _errorRouting();
       break;
      case '/detailProduct':
        if(args is int){
          return MaterialPageRoute(builder: (_)=>
              DetailProduct(id: args));
        }
        break;

    }
  }
  static Route<dynamic> _errorRouting(){
    return MaterialPageRoute(builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('gfhfghfg'),
          )
        );
    });
  }
}

