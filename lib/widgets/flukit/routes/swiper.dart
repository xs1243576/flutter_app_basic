import 'package:flukit/flukit.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';

class SwiperRoute extends StatelessWidget {
  final _images = ["sea", "star", "cat", "horse"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Swiper(
                indicatorAlignment: AlignmentDirectional.bottomEnd,
                speed: 400,
                indicator: CircleSwiperIndicator(),
                children: <Widget>[
                  Image.asset(Utils.getImgPath('sea'), fit: BoxFit.fill),
                  Image.asset(Utils.getImgPath('star'), fit: BoxFit.fill),
                  Image.asset(Utils.getImgPath('cat'), fit: BoxFit.fill),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: SizedBox(
                height: 200.0,
                child: Swiper(
                  circular: true,
                  //reverse: true, //反向
                  indicator: RectangleSwiperIndicator(),
                  children: <Widget>[
                    Image.asset(Utils.getImgPath('sea'), fit: BoxFit.fill),
                    Image.asset(Utils.getImgPath('star'), fit: BoxFit.fill),
                    Image.asset(Utils.getImgPath('cat'), fit: BoxFit.fill),
                    Image.asset(Utils.getImgPath('horse'), fit: BoxFit.fill),
                    Image.asset(Utils.getImgPath('road'), fit: BoxFit.fill),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Swiper(
                indicatorAlignment: AlignmentDirectional.topEnd,
                circular: true,
                indicator: NumberSwiperIndicator(),
                children: <Widget>[
                  Image.asset(Utils.getImgPath('sea'), fit: BoxFit.fill),
                  Image.asset(Utils.getImgPath('star'), fit: BoxFit.fill),
                  Image.asset(Utils.getImgPath('cat'), fit: BoxFit.fill),
                  Image.asset(Utils.getImgPath('horse'), fit: BoxFit.fill),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Swiper.builder(
                indicatorAlignment: AlignmentDirectional.topEnd,
                circular: true,
                childCount: _images.length,
                indicator: NumberSwiperIndicator(),
                itemBuilder: (context, index) {
                  //print(index);
                  return Image.asset(Utils.getImgPath(_images[index]),
                      fit: BoxFit.fill);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle(color: Colors.white70, fontSize: 11.0)),
    );
  }
}
