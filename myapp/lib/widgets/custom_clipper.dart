import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          //路径裁切控件
          ClipPath(
            clipper: BottomClipperTest(),
            child: Container(
              color: Colors.deepOrange,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);

    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width,size.height-50);
    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy
      );
    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class BottomClipperTest extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-70);

    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2.1,size.height-40);
    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy
      );

    // path.lineTo(size.width/2.5, size.height-50);
    
   var secondControlPoint = Offset(size.width/1.5, size.height-90);
    var secondEndPoint = Offset(size.width,size.height-40);
    path.quadraticBezierTo(
      secondControlPoint.dx, 
      secondControlPoint.dy, 
      secondEndPoint.dx, 
      secondEndPoint.dy
      );


    
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0);

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}