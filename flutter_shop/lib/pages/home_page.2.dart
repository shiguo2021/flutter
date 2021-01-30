import 'package:flutter/material.dart';
import '../service/service_methd.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据...';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getHomeData().then((value) {
      setState(() {
        homePageContent = value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('天上人间'),
      ),
      body: SingleChildScrollView(child: Text(homePageContent)),
    );
  }
}
