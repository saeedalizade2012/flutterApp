import 'package:flutter/material.dart';

class ResponsiveDevice extends StatelessWidget {

  final Widget mobile;
  final Widget tablet;

   ResponsiveDevice({ @required this.mobile, @required this.tablet});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation ;
    var widthDevice = MediaQuery.of(context).size.width ;
    var heightDevice = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context,constraints){
          if(widthDevice < 768 && isPortrait ==Orientation.portrait){
              return mobile;
          }else if(widthDevice < 768 && isPortrait ==Orientation.landscape){
            return tablet;
          }else{
            return tablet;
          }
    });
  }
}
