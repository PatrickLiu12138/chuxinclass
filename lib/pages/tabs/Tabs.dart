import 'package:flutter/material.dart';
import 'Find.dart';
import 'Home.dart';
import 'My.dart';
import 'Learn.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    FindPage(),
    LearnPage(),
    MyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('出心课堂'),
        // ),
        body:this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              this._currentIndex = index;
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