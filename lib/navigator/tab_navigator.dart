import 'package:flutter/material.dart';
import 'package:flutter_navigator/pages/home_page.dart';
import 'package:flutter_navigator/pages/my_page.dart';
import 'package:flutter_navigator/pages/search_page.dart';
import 'package:flutter_navigator/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigator();
}

class _TabNavigator extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // 禁止页面左右滚动
        physics: const NeverScrollableScrollPhysics(),
        // 页面左右滚动事件监听
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: '首页',
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: '搜索',
            icon: Icon(Icons.search, color: Colors.grey),
            activeIcon: Icon(Icons.search, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: '旅行',
            icon: Icon(Icons.camera_alt, color: Colors.grey),
            activeIcon: Icon(Icons.camera_alt, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: '我的',
            icon: Icon(Icons.account_circle, color: Colors.grey),
            activeIcon: Icon(Icons.account_circle, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
