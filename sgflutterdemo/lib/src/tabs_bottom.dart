import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './page/home.dart';
import './page/book.dart';
import './page/found.dart';
import './page/me.dart';
import './provider/AppModel.dart';
import 'package:provider/provider.dart';

class TabsBottom extends StatelessWidget {
  final items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '首页',
      activeIcon: Icon(CupertinoIcons.hammer),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.book),
      label: '目录',
      activeIcon: Icon(CupertinoIcons.hammer),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.sunset),
      label: '发现',
      activeIcon: Icon(CupertinoIcons.hammer),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: '我的',
      activeIcon: Icon(CupertinoIcons.hammer),
    ),
  ];

  final pages = [
    HomePage(),
    BookPage(),
    FoundPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // print({
    //   'index': context.watch<TabsBottomProvider>().tabIndex,
    // });

    return Scaffold(
      // body: pages[0],
      body: IndexedStack(
        index: context.watch<AppModel>().tabIndex,
        children: pages,
      ),

      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: context.watch<AppModel>().tabIndex,
        onTap: (index) {
          context.read<AppModel>().setTabIndex(index);
        },
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        // selectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(13)),
        // selectedFontSize: 16,
        // selectedIconTheme: IconThemeData(
        //     color: Colors.green, size: ScreenUtil().setHeight(24)),
      ),
    );
  }
}
