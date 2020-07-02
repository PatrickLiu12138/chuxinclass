import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //轮播图组件
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(90.0)),
      border: new Border.all(width: 1, color: Colors.red),
    ),
    child: AspectRatio(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imgList[index]["url"],
            fit: BoxFit.fill,
          );
        },
        itemCount: imgList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
        // control: new SwiperControl(),      //左右滑动的小箭头 不要
      ),
      aspectRatio: 1.5/1),
  );
  }


  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      _swiperWidget()
      ]
      );
  }
}
