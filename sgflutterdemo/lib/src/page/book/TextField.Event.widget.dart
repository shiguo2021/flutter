import 'package:flutter/material.dart';
import '../../index.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class TextField_event_widget extends StatefulWidget {
  String title;
  TextField_event_widget({this.title});

  @override
  _TextField_event_widgetState createState() => _TextField_event_widgetState();
}

class _TextField_event_widgetState extends State<TextField_event_widget> {
  String title;
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final ScrollController scrollController = ScrollController();
  String content;
  @override
  void initState() {
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: KeyboardAvoider(
          autoScroll: true,
          child: ListView(
            controller: scrollController,
            children: [
              Container(
                height: ScreenUtil().screenHeight - 200,
                child: Center(
                  child: content == null ? Text('键盘自适应') : Text(content),
                ),
              ),
              Divider(),
              Example(
                controller: controller,
                onChanged: (val) {
                  setState(() {
                    content = val;
                  });
                },
              ),
              Divider(),
              Example(
                controller: controller,
                onChanged: (val) {
                  setState(() {
                    content = val;
                  });
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {
                    print(controller.text);
                  },
                  child: Text('点击事件'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  TextEditingController controller;
  Function onChanged;
  Example({this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 44),
            child: Material(
              child: TextField(
                onChanged: onChanged,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintText: '请输入测试文字。。',
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                    // borderSide: BorderSide(width: 1, color: Colors.green),
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    ));
  }
}
