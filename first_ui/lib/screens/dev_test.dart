
import 'package:flutter/material.dart';


class DevTest extends StatefulWidget {
  @override
  _DevTestState createState() => new _DevTestState();
}

class _DevTestState extends State<DevTest> {


  @override
  void initState() {
    super.initState();
  }

//  void initState() {
//
//    super.initState();
//    Timer(Duration(seconds: 3), () => HomeScreen());
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: new Color(0xff7c94b6),
                gradient: LinearGradient(
                  colors: [new Color(0xff7c94e6), new Color(0xff5c94b1)],
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/ComicSpa_logo.png',
                  width: 176,
                  height: 42.5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'DevTest',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation(Color(0xFF7C94B6)),
                  backgroundColor: Colors.blueGrey,
                  strokeWidth: 1,
                ),
              ],
            )
          ],
        ));
  }
}