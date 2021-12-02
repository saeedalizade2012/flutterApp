import 'package:flutter/material.dart';
import 'package:storapp/screens/home/listProductWithDescription.dart';
import 'package:storapp/screens/home/searchBox.dart';
import 'package:storapp/screens/home/listCategory.dart';
import 'package:storapp/screens/home/slider.dart';
import 'package:storapp/screens/home/listSpecialProduct.dart';
import 'package:storapp/constant/constantCss.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SearchBox(),
              KsizeBox,
              ListCategoryHome(),
              KsizeBox,
              SliderHome(),
              KsizeBox,
              SpecialProduct(),
              KsizeBox,
              listProductWithDescription(),
            ],
          ),
        ),
      ],
    );
  }
}
