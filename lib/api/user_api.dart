import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {

  /// 根据设备编码获取token
  static Future loginByMobileDevice(String code, String os) async {

    FormData formData = new FormData.from({
      "device_id": code,
      "os": os,
      "XDEBUG_SESSION_START": 15977
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

  /// 用户信息
  static Future getUserProfile() async {

    FormData formData = new FormData.from({
      "XDEBUG_SESSION_START": 16116
    });

    var response = await HttpUtil().post('ecapi.user.profile.get', data: formData);
    Map map = json.decode(response.toString());
    if(map.length > 0){
      UserModel model = UserModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///用户详情
  static Future<UserModel> getUserInfoByUserId(int user_id, {int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.from({
      'page': page,
      'per_page': per_page,
      'user_id': user_id,
      "XDEBUG_SESSION_START": 16116
    });

    var response = await HttpUtil().post('ecapi.user.getProfileByUserId', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      UserModel model = UserModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

}