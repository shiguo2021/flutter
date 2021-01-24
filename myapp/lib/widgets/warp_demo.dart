import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> list;
  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }


  @override
  Widget build(BuildContext context) {
    //屏幕的宽度
    final width = MediaQuery.of(context).size.width;
    //屏幕的高度
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,



            //子元素流式布局
            child:Wrap(
              children: list,
              spacing: 26.0,
            )

            
          ),
        ),
      ),
    );
  }


  Widget buildAddButton(){
    return GestureDetector(
      onTap: (){
        if(list.length<9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(child: Text('照片'),),
      ),
    );
  }
}