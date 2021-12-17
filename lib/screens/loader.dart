import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:storapp/constant/constantCss.dart';
class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KprimaryColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SpinKitFadingCircle(
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color:  Colors.redAccent,
                borderRadius: BorderRadius.circular(50.0)
            ),
          );
        },
        size: 60.0,
      ),
    );
  }
}
