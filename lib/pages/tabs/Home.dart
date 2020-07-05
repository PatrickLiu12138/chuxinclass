import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/FocusModel.dart';
import '../../config/Config.dart';
import 'package:dio/dio.dart';
import '../../model/ProductModel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _focusData = [] ;
  List _hotData = [];
  @override
  void initState() {
    _getFocusData();
    _getHotData();
  }

  //获取轮播图数据
  _getFocusData() async{
    var api = '${Config.domain}api/focus';
    var result = await Dio().get(api);
    var focusData = FocusModel.fromJson(result.data);
    setState(() {
      this._focusData = focusData.result;

    });
  }

  //获取热门推荐
  _getHotData() async{
    var api = '${Config.domain}api/plist?is_best=1';    
    var result = await Dio().get(api);
    var hotData = ProductModel.fromJson(result.data);
    setState(() {
      this._hotData = hotData.result;
    });
  }

  //轮播图组件
  Widget _swiperWidget() {
    if(this._focusData.length > 0){
      return Container(
      margin: EdgeInsets.all(10.0), //外边框
      child: AspectRatio(
          child: PhysicalModel(
            //轮播图加圆角
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(16.0),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                String pic = this._focusData[index].pic;
                return Image.network(
                  "${Config.domain}${pic.replaceAll('\\', "/")}",
                  fit: BoxFit.fill,
                );
              },
              itemCount: this._focusData.length,
              pagination: new SwiperPagination(),
              autoplay: true,
              // control: new SwiperControl(),      //左右滑动的小箭头 不要
            ),
          ),
          aspectRatio: 2 / 1),
    );
    }
    else{
      return Text('加载中。。。');
    }
    
  }

  //标题组件
  Widget _titleWidget() {
    return Container(
      height: ScreenUtil().setHeight(46),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.red,
        width: ScreenUtil().setWidth(10),
      ))),
      child: Text('热门推荐'),
    );
  }

  //热门推荐商品
  Widget _recProductItemWidget() {
    var itemwidth = (ScreenUtil.screenWidth - 30) / 2;
    if (this._hotData.length > 0){
    return Container(
        padding: EdgeInsets.all(5),
        width: itemwidth,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(21)),
              child: Image.network(
                  "https://www.itying.com/images/flutter/list1.jpg",
                  fit: BoxFit.fitWidth),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Text(
                '2020最新朱伟老师恋念有词网课视频预约',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('￥23',
                          style: TextStyle(color: Colors.red, fontSize: 16)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text('￥18',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough)))
                  ],
                )),
          ],
        ));
        }
        else{
          return Text('数据加载中。。。');
        }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
    return ListView(children: <Widget>[
      _swiperWidget(), //轮播图
      SizedBox(height: ScreenUtil().setHeight(20)),
      Container(
        height: ScreenUtil().setHeight(40),
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 40,
            itemBuilder: (context, index) {
              return Text('导航框');
            }),
      ),
      _titleWidget(), //热门推荐

      Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            _recProductItemWidget(),
            _recProductItemWidget(),
            _recProductItemWidget(),
            _recProductItemWidget(),
            _recProductItemWidget(),
          ],
        ),
      )
    ]);
  }
}
