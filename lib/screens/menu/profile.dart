import 'package:flutter/material.dart';
import 'package:storapp/constant/constantCss.dart';

class ProfileUser extends StatefulWidget {

  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          KsizeBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child:  FutureBuilder<Widget>(
                    future: avatar(), // a previously-obtained Future<String> or null
                    builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data;  // image is ready
                      } else {
                        return  Container(
                          child: Text('noImage'),
                        );  // placeholder
                      }
                    },
                  ),
                ),
              ),

            ],
          )

        ],
    );
  }

  Future<FadeInImage> avatar() async{
    return await  FadeInImage.assetNetwork(
      placeholder: 'images/loaderApp.gif',
      image: "https://image.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg",
      height: 200.0,
      width: 200.0,
    );
  }
}
