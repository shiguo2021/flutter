import 'package:flutter/material.dart';
import '../index.dart';

class CustomCell extends StatelessWidget {
  String title;
  String subTitle;
  String content;
  Function onPress;
  IconData icon;
  Color backgroundColor;
  bool isShowNav;

  CustomCell({
    @required this.title = '标题',
    this.icon,
    this.subTitle,
    this.onPress,
    this.content,
    this.backgroundColor = Colors.white,
    this.isShowNav = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: ScreenUtil().setHeight(44),
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          decoration: BoxDecoration(
            color: backgroundColor,
            // border: Border(bottom: BorderSide(width: 1, color: Colors.black26)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: icon == null
                              ? null
                              : Row(children: [
                                  Icon(icon),
                                  SizedBox(
                                    width: 10,
                                  )
                                ]),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(14)),
                            ),
                            Container(
                              child: subTitle == null ? null : Text(subTitle),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: content == null
                              ? null
                              : Text(content,
                                  style: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
              Container(height: isShowNav ? 1 : 0, color: Color(0xFFcccccc))
            ],
          )),
    );
  }
}
