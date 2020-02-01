
import 'package:movie/globalconfig.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserListModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';

class CollectApi {

  ///收藏列表
  static Future<GoodProducts> getFavoritesList({int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.fromMap({
      'page': page,
      'per_page': GlobalConfig.PageSize,
      "XDEBUG_SESSION_START": 17366
    });

    var response = await HttpUtil().post('ecapi.video.liked.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      GoodProducts model = GoodProducts.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///关注列表
  static Future<UserListModel> getFollowsList({int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.fromMap({
      'page': page,
      'per_page': GlobalConfig.PageSize,
      "XDEBUG_SESSION_START": 15576
    });

    var response = await HttpUtil().post('ecapi.user.attentioned.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      UserListModel list = UserListModel.fromJson(map);
      return list;
    }
  }

}