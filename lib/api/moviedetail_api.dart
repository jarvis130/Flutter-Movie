import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/moviedetail.dart';
import 'package:movie/utils/httpUtil.dart';
import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';

class MoiveDetailApi {

  ///视频详情
  static Future<ProductModel> getMovieDetail(var movieId) async {

    FormData formData = new FormData.from({
      'product': movieId,
      "XDEBUG_SESSION_START": 12891
    });

    var response = await HttpUtil().post('ecapi.video.get', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      ProductModel model = ProductModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }
  
  ///检查观看次数
   static Future<Map> checkWatchTimes() async {

    FormData formData = new FormData.from({
      "XDEBUG_SESSION_START": 15902
    });

    var response = await HttpUtil().post('ecapi.video.checkWatchTimes', data: formData);
    Map map = json.decode(response.toString());
    if(map !=null && map.length > 0){
      return map;
    }
  }

    ///增加观看次数
   static Future<Map> addWatchLog(var videoid) async {
    FormData formData = new FormData.from({
      'video_id': videoid,
      "XDEBUG_SESSION_START": 10482
    });

    var response = await HttpUtil().post('ecapi.video.addWatchLog', data: formData);
    Map map = json.decode(response.toString());
    if(map !=null && map.length > 0){
      return map;
    }
  }

  ///收藏
  static Future<Map> setLike(var videoid) async {

    FormData formData = new FormData.from({
      'product': videoid,
      "XDEBUG_SESSION_START": 10482
    });

    var response = await HttpUtil().post('ecapi.video.like', data: formData);
    Map map = json.decode(response.toString());
    if(map.length > 0){
      return map;
    }
  }

  ///取消收藏
  static Future<Map> unLike(var videoid) async {

    FormData formData = new FormData.from({
      'product': videoid,
      "XDEBUG_SESSION_START": 10482
    });

    var response = await HttpUtil().post('ecapi.video.unlike', data: formData);
    Map map = json.decode(response.toString());
    if(map.length > 0){
      return map;
    }
  }

    ///关注
  static Future<Map> setAttention(var userId) async {

    FormData formData = new FormData.from({
      'att_user_id': userId,
      "XDEBUG_SESSION_START": 12124
    });

    var response = await HttpUtil().post('ecapi.user.setAttention', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

  ///取消关注
  static Future<Map> setUnAttention(var userId) async {

    FormData formData = new FormData.from({
      'att_user_id': userId,
      "XDEBUG_SESSION_START": 17829
    });

    var response = await HttpUtil().post('ecapi.user.setUnattention', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

  ///查询是否关注
  static Future<Map> getAttention(var userId) async {

    FormData formData = new FormData.from({
      'att_user_id': userId,
      "XDEBUG_SESSION_START": 10482
    });

    var response = await HttpUtil().post('ecapi.user.getAttention', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }

}