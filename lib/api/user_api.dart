import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {

  //根据设备编码获取token
  static Future loginByMobileDevice(String code, String os) async {

    FormData formData = new FormData.from({
      "device_id": code,
      "os": os
    });

    var response = await HttpUtil().post('ecapi.auth.signinByDevice', data: formData);
    Map map = json.decode(response.toString());
    if(map.length > 0){
      UserModel model = UserModel.fromJson(map);
      if(model.errorCode == 0){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', model.token);
        prefs.setString('userId', model.user.id.toString());
        prefs.setString('username', model.user.username);
        prefs.setString('rankName', model.user.rank.name);
        prefs.setString('rankId', model.user.rank.id.toString());
//        print('rankName:' + prefs.getString('rankName'));
      }
    }
  }


}