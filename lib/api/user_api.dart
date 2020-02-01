import 'dart:convert' show json;
import 'dart:io';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {

  /// 根据设备编码获取token
  static Future loginByMobileDevice(String code, String os) async {

    FormData formData = new FormData.fromMap({
      "device_id": code,
      "os": os,
      "XDEBUG_SESSION_START": 12474
    });

    var response = await HttpUtil().post('ecapi.auth.signinByDevice', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
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

    FormData formData = new FormData.fromMap({
      "XDEBUG_SESSION_START": 16116
    });

    var response = await HttpUtil().post('ecapi.user.profile.get', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      UserModel model = UserModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///用户详情
  static Future<UserModel> getUserInfoByUserId(int user_id, {int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.fromMap({
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

  ///绑定手机号
  static Future<Map> bindingPhone({String mobile = '', String code = '', String password = ''}) async {

    FormData formData = new FormData.fromMap({
      'mobile': mobile,
      'code': code,
      'password': password,
      "XDEBUG_SESSION_START": 16116
    });

    var response = await HttpUtil().post('ecapi.auth.mobile.binding', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

  ///更新头像
  static Future<Map> updateAvatar({File file}) async {

    String path = file.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = path.substring(path.lastIndexOf(".") + 1, path.length);
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(
          path,
          filename: name
      ),
      "avatar_path": path,
      "suffix": suffix,
      "XDEBUG_SESSION_START": 13502
    });

    var response = await HttpUtil().post('ecapi.user.avatar.update', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

}