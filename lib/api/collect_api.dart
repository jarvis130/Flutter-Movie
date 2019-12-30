import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/concernlist.dart';
import 'package:movie/utils/httpUtil.dart';
import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';

class CollectApi {

  ///收藏列表
  static Future<GoodProducts> getFavoritesList({int page = 1, int per_page = 20}) async {

    FormData formData = new FormData.from({
      'page': page,
      'per_page': per_page,
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
  static Future<ConcernListModel> getFollowsList(String uid, String touid, {int page = 1}) async {
    ConcernListModel model;
    String param = 'service=User.getFollowsList&uid=$uid&touid=$touid&p=$page&key=';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = ConcernListModel(r);
    return model;
  }

 ///
//  static Future<VideoListModel> getClassifyVideoList(String uid, String classifyId, int page) async {
//     VideoListModel model;
//     String param = 'service=Video.GetClassifyVideoList&uid=$uid&classify=$classifyId&p=$page';
//     var r = await ApiHelper.httpGet(param, cached: false);
//     if (r != null) model = VideoListModel(r);
//     return model;
//   }

}