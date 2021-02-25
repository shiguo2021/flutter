import 'package:flutter/material.dart';
import '../index.dart';

class Cell extends StatelessWidget {
  String title;
  String subTitle;
  String content;
  Function onPress;

  Cell({
    this.title = '标题',
    this.subTitle,
    this.onPress,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: ScreenUtil().setHeight(44),
        padding: EdgeInsets.fromLTRB(8, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black26))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                ),
                Container(
                  child: subTitle == null ? null : Text(subTitle),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: content == null
                      ? null
                      : Text(content, style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
