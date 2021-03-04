import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgflutterdemo/src/index.dart';
import '../base/base.controller.dart';

class CupertinoPicker_widget extends Base_controller {
  CupertinoPicker_widget({title}) : super(title: title);

  @override
  Widget initViews(BuildContext context) {
    return ListView(
      children: [
        Divider(),
        Example0(),
        Divider(),
        Example1(),
        Divider(),
      ],
    );
  }
}

class Example0 extends StatelessWidget {
  List list = List.generate(30, (index) => '$index');
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CupertinoPicker'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('取消')),
                TextButton(onPressed: () {}, child: Text('确定')),
              ],
            ),
            Expanded(
              child: CupertinoPicker(
                backgroundColor: Colors.purple,
                // diameterRatio: 2,
                // useMagnifier: true,
                // offAxisFraction: 1,//轴偏移，默认是0.0。控制选中的子widget的左右偏移
                itemExtent: ScreenUtil().setHeight(44), //item的高度
                onSelectedItemChanged: (index) {
                  print(index);
                },
                children: list
                    .map((e) => Text(e, style: TextStyle(color: Colors.white)))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange,
        height: ScreenUtil().setHeight(250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CupertinoTimerPicker'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('取消')),
                TextButton(onPressed: () {}, child: Text('确定')),
              ],
            ),
            Expanded(
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hms, //可以设置时分、时分秒和分秒三种模式
                initialTimerDuration:
                    Duration(hours: 1, minutes: 35, seconds: 50), // 默认显示的时间值
                minuteInterval: 5, // 分值间隔，必须能够被initialTimerDuration.inMinutes整除
                secondInterval:
                    10, // 秒值间隔，必须能够被initialTimerDuration.inSeconds整除，此时设置为10，则选择项为0、10、20、30、40、50六个值
                onTimerDurationChanged: (duration) {
                  print(
                      '当前选择了：${duration.inHours}时${duration.inMinutes - duration.inHours * 60}分${duration.inSeconds - duration.inMinutes * 60}秒');
                },
              ),
            ),
          ],
        ));
  }
}
