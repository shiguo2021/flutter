import 'package:flutter/material.dart';
 
class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(

        //轻量级提示 , 长按
        child: Tooltip(
          message: '不要碰我,我怕痒',
          child: Image.network('https://imgsa.baidu.com/forum/pic/item/a61ea8d3fd1f413493bd92772a1f95cad1c85e34.jpg',scale: 4,),
        ),
      ),
    );
  }
}