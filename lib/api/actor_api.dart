import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/ActorAttentionModel.dart';
import 'package:movie/models/ActorModel.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/HomeModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'package:movie/models/searchresult.dart';

class ActorApi {

  ///演员信息
  static Future<ActorModel> getActorInfo(String actorId, {int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.fromMap({
      'actor_id': actorId,
      'page': page,
      'per_page': per_page,
      'XDEBUG_SESSION_START': 15196
    });

    var response = await HttpUtil().post('ecapi.actor.getvideolistbyactorid', data: formData);
    Map map = json.decode(response.toString());
    if(map!=null && map.length > 0){
      ActorModel model = ActorModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///关注
  static Future<Map> setAttention(var actorId) async {

    FormData formData = new FormData.fromMap({
      'actor_id': actorId,
      "XDEBUG_SESSION_START": 12124
    });

    var response = await HttpUtil().post('ecapi.actor.setAttention', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

  ///取消关注
  static Future<Map> setUnAttention(var actorId) async {

    FormData formData = new FormData.fromMap({
      'actor_id': actorId,
      "XDEBUG_SESSION_START": 17829
    });

    var response = await HttpUtil().post('ecapi.actor.setUnattention', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

  ///关注列表
  static Future<ActorAttentionModel> getActorList({int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.fromMap({
      'page': page,
      'per_page': GlobalConfig.PageSize,
      "XDEBUG_SESSION_START": 15576
    });

    var response = await HttpUtil().post('ecapi.actor.attentioned.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      ActorAttentionModel list = ActorAttentionModel.fromJson(map);
      return list;
    }
  }

  ///查询是否关注
  static Future<Map> getAttention(var actorId) async {

    FormData formData = new FormData.fromMap({
      'actor': actorId,
      "XDEBUG_SESSION_START": 10482
    });

    var response = await HttpUtil().post('ecapi.actor.getAttention', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

}