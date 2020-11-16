import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';

class PhotoViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoStart: false,
      circular: true,
      indicator: CircleSwiperIndicator(
        padding: EdgeInsets.only(bottom: 30.0),
        itemColor: Colors.black26,
      ),
      children: <Widget>[
        Image.asset(Utils.getImgPath('sea'), fit: BoxFit.fill),
        Image.asset(Utils.getImgPath('avatar'), fit: BoxFit.fill),
        Image.asset(Utils.getImgPath('star'), fit: BoxFit.fill),
        Image.asset(Utils.getImgPath('cat'), fit: BoxFit.fill),
        Image.asset(Utils.getImgPath('horse'), fit: BoxFit.fill),
        Image.asset(Utils.getImgPath('road'), fit: BoxFit.fill)
      ].map((v) {
        return ScaleView(child: v);
      }).toList(),
    );
  }
}
