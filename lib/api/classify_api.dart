
import 'package:movie/models/VideoAttributeModel.dart';
import 'package:movie/utils/httpUtil.dart';
import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';

class ClassifyApi {

  /// 视频属性
  static Future getVideoAttribute() async {

    FormData formData = new FormData.fromMap({
    });

    var response = await HttpUtil().post('ecapi.attr.getVideoAttribute', data: formData);
    Map map = json.decode(response.toString());
    if(map.length > 0){
      VideoAttributeModel model = VideoAttributeModel.fromJson(map);
      if(model.errorCode == 0){
        return model;
      }
    }
  }

}