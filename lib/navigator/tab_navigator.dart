

import 'package:deviceclient/pages/home_page.dart';
import 'package:deviceclient/pages/my_page.dart';
import 'package:deviceclient/pages/search_page.dart';
import 'package:deviceclient/pages/travel_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}


class _TabNavigatorState extends State<TabNavigator> {
  // 定义 颜色常量
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  // 当前页面
  int _currentIndex = 1;
  final  PageController _controller = PageController (
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 当前所在的页面
        currentIndex: _currentIndex,
        // 点击的回调函数 当前页面 的index
        onTap: (index) {
          // 跳转到选择的页面
          _controller.jumpToPage(index);
          // 设置 index
          setState(() {
            _currentIndex = index;
          });
        },
        // bottom navigation bar 的文字 非 选中时 显示
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.home,  color: _defaultColor),
            activeIcon: Icon( Icons.home, color: _activeColor ),
            title: Text('首页',style: TextStyle(color: _currentIndex != 1 ? _defaultColor : _activeColor )),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.search,  color: _defaultColor),
            activeIcon: Icon( Icons.search, color: _activeColor ),
            title: Text('搜索',style: TextStyle(color: _currentIndex != 2 ? _defaultColor : _activeColor )),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.camera_alt,  color: _defaultColor),
            activeIcon: Icon( Icons.camera_alt, color: _activeColor ),
            title: Text('旅拍',style: TextStyle(color: _currentIndex != 3 ? _defaultColor : _activeColor )),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.account_circle,  color: _defaultColor),
            activeIcon: Icon( Icons.account_circle, color: _activeColor ),
            title: Text('我的',style: TextStyle(color: _currentIndex != 4 ? _defaultColor : _activeColor )),
          ),
        ],
      ),
    );
  }

}