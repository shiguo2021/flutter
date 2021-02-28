import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class Keyboard_avoiderWidgetPage extends StatelessWidget {
  String title;
  Keyboard_avoiderWidgetPage({this.title});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Flexible(flex: 2, child: _buildPlaceholder(Colors.red)),
                    Flexible(flex: 1, child: _buildPlaceholder(Colors.pink)),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Flexible(flex: 4, child: _buildForm(40, Colors.green)),
                    Flexible(
                      flex: 1,
                      child: _buildPlaceholder(Colors.lightGreen),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Flexible(flex: 1, child: _buildPlaceholder(Colors.blue)),
                    Flexible(
                        flex: 2, child: _buildPlaceholder(Colors.lightBlue)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildForm(int rows, Color color) {
    return Container(
      color: color,
      child: KeyboardAvoider(
        autoScroll: true,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          controller: _scrollController,
          itemCount: rows,
          itemBuilder: (context, index) {
            return Material(
              child: TextFormField(
                initialValue: 'TextFormField ${index + 1}',
                decoration: InputDecoration(fillColor: color, filled: true),
              ),
            );
          },
        ),

        // child: SingleChildScrollView(
        //   controller: _scrollController,
        //   child: Column(
        //     // List(40)
        //     // children:
        //     //     List<String>.generate(40, (index) => 'item $index').map((e) {
        //     //   return Material(
        //     //     child: TextFormField(
        //     //       initialValue: 'TextFormField ${e}',
        //     //       decoration: InputDecoration(fillColor: color, filled: true),
        //     //     ),
        //     //   );
        //     // }).toList(),

        //     children: [
        //       ...List.generate(40, (index) => 'sg $index').map((e) {
        //         return TextFormField(
        //           initialValue: 'TextFormField ${e}',
        //           decoration: InputDecoration(fillColor: color, filled: true),
        //         );
        //       })
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget _buildPlaceholder(Color color) {
    return Container(
      color: color,
      // child: KeyboardAvoider(
      //   child: Placeholder(),
      // ),
    );
  }
}
