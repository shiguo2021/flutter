import 'package:flutter/material.dart';
import '../index.dart';
import '../widgets/index.dart';

class BookPage extends StatefulWidget {
  BookPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List dataList = [];

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString('lib/src/data/widgets.json')
        .then((res) {
      /**res is String */
      setState(() {
        dataList = json.decode(res)['widgets'];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (_, index) {
            String title = dataList[index];
            return Cell(
              title: title,
              onPress: () {
                // TextFieldWidgetPage
                Application.router
                    .navigateTo(context, '/${title}WidgetPage?title=${title}');
              },
            );
          },
          itemCount: dataList.length,
        ),
      ),
    );
  }
}
