import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin{


  int _selectIndex = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
    var leftWidth = (ScreenUtil.screenWidth)/4;
    var rightItemWidth = ((ScreenUtil.screenWidth)-leftWidth-20-20)/3;
    rightItemWidth = ScreenUtil().setWidth(rightItemWidth);
    var rightItemHeight = rightItemWidth + ScreenUtil().setHeight(29);
    return Row(
      children: <Widget>[
        Container(              //左侧导航栏
          width: leftWidth,
          height: double.infinity,
          // color: Colors.blue,
          child:ListView.builder(
            itemCount: 28,
            itemBuilder: (context, index){
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap:(){
                      setState(() {
                        _selectIndex = index;
                      });
                    },
                    child:Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(84),
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child:Text('第${index}',
                      textAlign: TextAlign.center,
                      ),
                      color: _selectIndex == index?Colors.blue:Colors.white,
                    ),
                  ),
                Divider(
                  height: 1,
                )
                ],
              );
            },
          ),
        ),
        Expanded(              //右侧商品栏
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 1),
            child: GridView.builder(
              itemCount: 18,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: rightItemWidth/rightItemHeight,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ), 
              itemBuilder: (context, index){
                return Container(
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1/1,
                        child: Image.network('https://www.itying.com/images/flutter/list8.jpg', 
                        fit: BoxFit.cover),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(29),
                        child: Text("女装",
                        style: TextStyle(
                          background: new Paint()..color = Colors.yellow,
                        ),),
                      ),
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }


}