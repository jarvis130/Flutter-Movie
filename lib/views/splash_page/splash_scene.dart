import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'skip_down_time.dart';
import '../../app.dart';

class SplashScene extends StatefulWidget {
  SplashScene({Key key}) : super(key: key);

  @override
  SplashSceneState createState() {
    return new SplashSceneState();
  }
}

class SplashSceneState extends State<SplashScene>
    implements OnSkipClickListener {
  @override
  void initState() {
    super.initState();
    delayedGoHomePage();
  }

  delayedGoHomePage() {
    Future.delayed(new Duration(seconds: 3), () {
      goHomePage();
    });
  }

  goHomePage() {
//    NavigatorUtils.push(context, Routers.root, replace: true);
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.asset('images/guide1.png'),
                alignment: Alignment.center,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(top: 50.0, right: 20.0),
              child: SkipDownTimeProgress(
                Color(0xFF888888),
                22.0,
                new Duration(seconds: 3),
                new Size(25.0, 25.0),
                skipText: "跳过",
                clickListener: this,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onSkipClick() {
    goHomePage();
  }
}