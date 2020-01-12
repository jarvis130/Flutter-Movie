import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:movie/models/SearchModel.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/searchresult.dart';
import 'package:movie/utils/httpUtil.dart';
class SearchApi {

  /// 搜索
  static Future<SearchModel> getList({String keyword='', int page = 1, int per_page = 20}) async {
    FormData formData = new FormData.from({
      "XDEBUG_SESSION_START": 12175,
      'page': page,
      'per_page': per_page,
      "keyword": keyword
    });

    var response = await HttpUtil().post('ecapi.search.product.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      SearchModel list = SearchModel.fromJson(map);
      return list;
    }
  }


}