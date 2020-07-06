import 'package:flutter/material.dart';
import 'Find.dart';
import 'Home.dart';
import 'My.dart';
import 'Learn.dart';
import 'Category.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  PageController _pageController ;

  List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),                                 //FindPage(),
    LearnPage(),
    MyPage(),
  ];
  @override
  void initState(){
    super.initState();
    _pageController = new PageController(
      initialPage: this._currentIndex
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('出心课堂'),
        // ),
        body:PageView(
          controller:this._pageController,
          children:this._pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              this._currentIndex = index;
              this._pageController..jumpToPage(this._currentIndex);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('主页')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('发现')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('学习')
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的')
              ),
          ],
          
          ),
      );
  }
}