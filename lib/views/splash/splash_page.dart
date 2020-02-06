
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie/api/user_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/provider/user_state.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/utils/image_utils.dart';
import 'package:movie/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flustars/flustars.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  int _status = 0;
  String ip;
//  List<String> _guideList = [
//    "app_start_1",
//    "app_start_2",
//    "app_start_3",
//  ];
  List<String> _guideList = [
    'images/guide1.png',
    'images/guide2.png',
    'images/guide3.png',
    'images/guide4.png',
  ];
  List<String> _guideInfoList = [
    "陪你每一个夜晚",
    "同你去往每个地方",
    "懂你，更懂你所爱",
    "因为在意，所以用心",
  ];
  StreamSubscription _subscription;

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        ip = data['origin'];
        // 设备码登录
        UserModel model = await UserApi.loginByMobileDevice(context, ip);
        if(model != null){
          _setState(model, context);
        }
      } else {
        ip =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      ip = 'Failed getting IP address';
    }
  }

  _setState(UserModel model, BuildContext context){
    if(model.user.id != null)
      Provider.of<UserState>(context).setUserId(model.user.id);
    if(model.user.username != null)
      Provider.of<UserState>(context).setUsername(model.user.username);
    if(model.user.rank.name != null)
      Provider.of<UserState>(context).setRank(model.user.rank.name);
    if(model.user.avatar != null)
      Provider.of<UserState>(context).setAvatar(model.user.avatar);
    if(model.user.watchedTimes != null)
      Provider.of<UserState>(context).setWatchedTimes(model.user.watchedTimes.toString());
    if(model.user.watchTimes != null)
      Provider.of<UserState>(context).setWatchTimes(model.user.watchTimes.toString());
  }

  @override
  void initState() {
    super.initState();
    _getIPAddress();

    _initSplash();
  }
  
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
  
  void _initAsync() async {
    await SpUtil.getInstance();
    if (SpUtil.getBool(Constant.key_guide, defValue: true)) {
      SpUtil.putBool(Constant.key_guide, false);
      _initGuide();
    } else {
      _goLogin();
    }
  }

  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }
  
  void _initSplash(){
    _subscription = Observable.just(1).delay(Duration(milliseconds: 2000)).listen((_){
      _initAsync();
    });
  }
  
  _goLogin(){
//    NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);
    Navigator.of(context).pushNamedAndRemoveUntil('mainpage', (Route<dynamic> route) => false);
  }
  
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child: Stack(
//        children: <Widget>[
//          Offstage(
//            offstage: !(_status == 0),
//            child: Image.asset(
//              Utils.getImgPath("start_page", format: "jpg"),
//              width: double.infinity,
//              fit: BoxFit.fill,
//              height: double.infinity,
//            ),
//          ),
//          Offstage(
//            offstage: !(_status == 1),
//            child: Swiper(
//              itemCount: _guideList.length,
//              loop: false,
//              itemBuilder: (_, index){
//                return loadAssetImage(
//                  _guideList[index],
//                  fit: BoxFit.cover,
//                  width: double.infinity,
//                  height: double.infinity,
//                );
//              },
//              onTap: (index){
//                if (index == _guideList.length - 1){
//                  _goLogin();
//                }
//              },
//            )
//          )
//        ],
//      ),
//    );
//  }

  Widget _buildListCell(int i) {
    return Stack(
      children: <Widget>[
        new Image.asset(
          _guideList[i],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        new Center(
          child: new Text(
            _guideInfoList[i],
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildListCellLast() {
    return Stack(
      children: <Widget>[
        Image.asset(
          _guideList[3],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: new Text(
            _guideInfoList[3],
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: new Container(
            margin: EdgeInsets.only(bottom: 50.0),
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil('mainpage', (Route<dynamic> route) => false);
              },
              child: new Container(
                width: 185,
                alignment: Alignment.center,
                height: 48,
                child: new Text(
                  '立即启程',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    color: Color(0X19FFFFFF),
                    border:
                    new Border.all(width: 1, color: Colors.white70)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: !(_status == 0),
            child: Image.asset(
              Utils.getImgPath("start_page", format: "jpg"),
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Offstage(
              offstage: !(_status == 1),
              child: Swiper(
                scrollDirection: Axis.horizontal,
                itemCount: _guideList.length,
                loop: false,
                itemBuilder: (_, index){
                  return index != _guideList.length-1 ? _buildListCell(index) : _buildListCellLast();
                },
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  )
                ),
//                itemBuilder: (_, index){
//                  return loadAssetImage(
//                    _guideList[index],
//                    fit: BoxFit.cover,
//                    width: double.infinity,
//                    height: double.infinity,
//                  );
//                },
//                onTap: (index){
//                  if (index == _guideList.length - 1){
//                    _goLogin();
//                  }
//                },
              )
          )
        ],
      ),
    );
  }

}
