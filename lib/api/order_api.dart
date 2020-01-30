import 'dart:convert' show json;
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:movie/models/OrderListModel.dart';
import 'package:movie/utils/httpUtil.dart';
class OrderApi {

  /// 订单列表
  static Future<OrderListModel> orderList({int page = 1, int per_page = 20, int status = 0}) async {
    FormData formData = new FormData.from({
      'page': page,
      'per_page': per_page,
      "status": status
    });

    var response = await HttpUtil().post('ecapi.order.list', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      OrderListModel model = OrderListModel.fromJson(map);
      return model;
    }
  }

  /// 下单
  static Future<Map> orderConfirm({int shop=1, int consignee = 1, int shipping = 1, var cart_good_id }) async {
    FormData formData = new FormData.from({
      "shop": shop,// 店铺ID
      'consignee': consignee,// 收货人ID
      'shipping': shipping,// 快递ID
      "cart_good_id": cart_good_id// 购物车商品id数组
    });

    var response = await HttpUtil().post('ecapi.cart.createVideoOrder', data: formData);
    Map map = json.decode(response.toString());
    if(map != null && map.length > 0){
      return map;
    }
  }


}