import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

///
/// des:
///

//class carousel_pro extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: true,
//    title: 'Carousel Pro',
//    home: CarouselPage(),
//  ));
//}


//A Flutter Carousel Slider widget. Support Network and Asset Images. You can modify the UI according your design easily.


class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150.0,
          width: 300.0,
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: false,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 6.0,
            dotIncreasedColor: Color(0xFFFF335C),
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.topRight,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7.0,
            images: [
//              NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
//              NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              ExactAssetImage("images/1.png"),
              ExactAssetImage("images/2.png"),
              ExactAssetImage("images/3.png"),
            ],
          ),
        ),
      ),
    );
  }
}


