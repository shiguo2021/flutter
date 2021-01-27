import 'package:flutter/material.dart'; //通用设计风格  [məˈtɪriəl]
import 'package:flutter/cupertino.dart'; //ios的设计风格   [ˌkupərˈtinoʊ]
import 'home_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'catgory_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '首页',
      activeIcon: Icon(CupertinoIcons.car),
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        activeIcon: Icon(CupertinoIcons.airplane),
        label: '分类'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.cart),
        activeIcon: Icon(Icons.bike_scooter),
        label: '购物车'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person),
        activeIcon: Icon(Icons.child_care),
        label: '会员中心')
  ];

  final List pages = [
    HomePage(),
    CatgoryPage(),
    CartPage(),
    MemberPage(),
  ];

  var currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage = pages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: currentIndex,
        backgroundColor: Colors.green,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = pages[index];
          });
        },
      ),
    );
  }
}
