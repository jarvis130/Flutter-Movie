import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/WatchLogModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'package:movie/models/searchresult.dart';

class ProductApi {

  ///商品列表
  static Future<GoodProducts> getList({int page = 1, int per_page = 20, int is_hot = 0, int is_best = 0, int is_new = 0, String attr_value1 = '', String attr_value2 = '', String is_real = '-1', int pub_id = 0}) async {
    FormData formData = new FormData.from({
      "page": page,
      "per_page": per_page,
      "is_hot": is_hot,
      "is_best": is_best,
      "is_new": is_new,
      "attr_value1": attr_value1,
      "attr_value2": attr_value2,
      "is_real": is_real,
      "pub_id": pub_id,
      "XDEBUG_SESSION_START": 14403
    });
    var response = await HttpUtil().post('ecapi.video.list', data: formData);
    if(response != null){
      Map map = json.decode(response.toString());
      if(map.length > 0){
        GoodProducts model = GoodProducts.fromJson(map);
        if(map['error_code'] == 0){
          return model;
        }
      }
    }
  }

  ///观看记录
  static Future<WatchLogModel> getWatchLog({int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.from({
      'page': page,
      'per_page': per_page,
      "XDEBUG_SESSION_START": 16116
    });

    var response = await HttpUtil().post('ecapi.video.getWatchLog', data: formData);
    Map map = json.decode(response.toString());
    if(map.length > 0){
      WatchLogModel model = WatchLogModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///搜索
  static Future<SearchResultModel> searchMulit(String query, var uid, {int page = 1, bool searchadult = false}) async {
    SearchResultModel model;
    String param = 'service=Home.VideoSearch&key=$query&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null)
      model = SearchResultModel(r);
    return model;
  }
}