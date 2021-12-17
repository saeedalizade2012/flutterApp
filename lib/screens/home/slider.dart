import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/6f321832856a7ec2a2fcde4e4d6f2899606fd9cf_1632395144.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/83546e4ef66d4a9f8ad1b1ee16d305c20efbb0af_1632319190.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/5f37b45d530de64385a7b89d31771bbe68e85df0_1632684593.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/d0ce66f275a1267d85257c377831fc2efbe0e0ef_1632316441.jpg?x-oss-process=image/quality,q_80',
  'https://dkstatics-public.digikala.com/digikala-adservice-banners/6f321832856a7ec2a2fcde4e4d6f2899606fd9cf_1632395144.jpg?x-oss-process=image/quality,q_80',
];

final List<Widget> imageSliders = imgList .map((item) => Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),

          ],
        )),
))
    .toList();

class SliderHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliderHome();
  }
}

class _SliderHome extends State<SliderHome> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 150.0,
        width: double.infinity,
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
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 24.0,
              height: 5.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  color: _current == entry.key ? Color(0xFF058C9C) : Color(0xFF7F7F7F)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
