import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/utils/httpUtil.dart';
class CommentApi {

  /// 评论列表
  static Future<CommentModel> getList({int product=0, int page = 1, int per_page = 20}) async {
    FormData formData = new FormData.fromMap({
      "XDEBUG_SESSION_START": 12175,
      'page': page,
      'per_page': per_page,
      "product": product
    });

    var response = await HttpUtil().post('ecapi.comment.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      CommentModel list = CommentModel.fromJson(map);
      return list;
    }
  }

  /// 评论
  static Future<Map> addComment({int comment_type = 0, int id_value = 0, String content='', int status = 0}) async {
    FormData formData = new FormData.fromMap({
      "XDEBUG_SESSION_START": 12175,
      'comment_type': comment_type,
      'id_value': id_value,
      'content': content,
      'status': status
    });

    var response = await HttpUtil().post('ecapi.comment.create', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }
}