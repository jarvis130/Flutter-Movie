import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/HomeModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'package:movie/models/searchresult.dart';

class HomeApi {

  ///轮播图
  static Future getSwiperList() async {

    FormData formData = new FormData.fromMap({});

    var response = await HttpUtil().post('ecapi.banner.list', data: formData);
    Map map = json.decode(response.toString());
    if(map!=null && map.length > 0){
      BannerModel model = BannerModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///热播视频
  static Future<HomeModel> home(String uid, {int page = 1}) async {
    FormData formData = new FormData.fromMap({

    });

    var response = await HttpUtil().post('ecapi.home.video.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      HomeModel model = HomeModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

  ///搜索
  static Future<SearchResultModel> searchMulit(String query, var uid, {int page = 1, bool searchadult = false}) async {
    SearchResultModel model;
//    String param = 'service=Home.VideoSearch&key=$query&uid=$uid&p=$page';
//    var r = await ApiHelper.httpGet(param, cached: false);
//    if (r != null)
//      model = SearchResultModel(r);
    return model;
  }
}