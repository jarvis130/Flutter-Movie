
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie/style/resources.dart';
import 'package:movie/utils/image_utils.dart';
import 'package:movie/widgets/click_item.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/globalconfig.dart';

class LinkPage extends StatefulWidget {
  @override
  _LinkPageState createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {

  var _styles = [FlutterLogoStyle.stacked, FlutterLogoStyle.markOnly, FlutterLogoStyle.horizontal];
  var _colors = [Colors.red, Colors.green, Colors.brown, Colors.blue, Colors.purple, Colors.pink, Colors.amber];
  var _curves = [
    Curves.ease, Curves.easeIn, Curves.easeInOutCubic, Curves.easeInOut,
    Curves.easeInQuad, Curves.easeInCirc, Curves.easeInBack, Curves.easeInOutExpo,
    Curves.easeInToLinear, Curves.easeOutExpo, Curves.easeInOutSine, Curves.easeOutSine,
  ];
  
  // 取随机颜色
  Color _randomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }

  Timer _countdownTimer;

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // 2s定时器
    _countdownTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      // https://www.jianshu.com/p/e4106b829bff
      if (!mounted){
        return;
      }
      setState(() {
        
      });
    });
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        title: Text(
          '聯繫客服',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
            context: context,
            tiles: [
              _buildItem('QQ', '123456', 'link/qq'),
              _buildItem('微信号', '123456', 'link/wechat'),
            ]
        ).toList(),
      )
    );
  }

  Widget _buildItem(String title, String content, String imgName){

    return ListTile(
//      leading: Container(
//          child: loadAssetImage(imgName, width: 16.0, height: 16.0),
//          width: 60,
//          height: 60,
//          color: Colors.grey),
      title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp16
          )
      ),
//      subtitle: Text(
//          model.breadcrumb,
//          style: TextStyle(
//              fontSize: Dimens.font_sp14
//          )
//      ),
      trailing: Text(
          content,
          style: TextStyle(
              fontSize: Dimens.font_sp14
          )
      ),
      onTap: () {

      },
    );

  }
}
