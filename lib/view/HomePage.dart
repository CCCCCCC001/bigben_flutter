import 'package:flutter/material.dart';

import 'ChatPage.dart';
import 'ClockPage.dart';
import 'StatisticsPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> pages = []; //需要切换的page

  @override
  void initState() {
    pages..add(StatisticsPage())..add(ClockPage())..add(CharPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: bottomBar(), //所记录的笔记布局
    );
  }

  bottomBar() {
    return BottomNavigationBar(
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            title: Text(
              '统计',
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.baby_changing_station),
            activeIcon: Icon(Icons.baby_changing_station),
            title: Text('时钟')),
        BottomNavigationBarItem(
            icon: Icon(Icons.call_end_outlined),
            activeIcon: Icon(Icons.call_end),
            title: Text('聊天')),
      ],
      onTap: _onItemTapped,
      fixedColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.black,
      currentIndex: _selectedIndex,
    );
  }

  int _selectedIndex = 1;

  void _onItemTapped(int value) {
    //底部选择
    setState(() {
      _selectedIndex = value;
    });
  }
}