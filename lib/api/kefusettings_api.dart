import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/KefuSettingsModel.dart';
import 'package:movie/models/OrderListModel.dart';
import 'package:movie/utils/httpUtil.dart';
class KefuSettingsApi {

  /// 订单列表
  static Future<KefuSettingsModel> getList() async {
    FormData formData = new FormData.fromMap({

    });

    var response = await HttpUtil().post('ecapi.kefu.setting.get', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      KefuSettingsModel model = KefuSettingsModel.fromJson(map);
      return model;
    }
  }


}