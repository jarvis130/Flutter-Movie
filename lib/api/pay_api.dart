
import 'package:movie/models/topupmodel.dart';
class PayApi {

  ///充值商品列表
  static Future<TopupGoodsListModel> getTopupGoodsList(String client, String uid) async {
    TopupGoodsListModel model;
//    String param = 'service=Topup.getTopupGoodsList&uid=$uid&client=$client';
//    var r = await ApiHelper.httpGet(param, cached: false);
//    if (r != null) model = TopupGoodsListModel(r);
    return model;
  }

  ///充值方式列表
  static Future<PaymentMethodListModel> getPaymentMethodList(String uid, String goodsid) async {
    PaymentMethodListModel model;
//    String param = 'service=Topup.getPaymentMethodList&uid=$uid&goods_id=$goodsid';
//    var r = await ApiHelper.httpGet(param, cached: false);
//    if (r != null) model = PaymentMethodListModel(r);
    return model;
  }

  ///充值
  static Future<TopupModel> topup(String uid, String token, String goods_id, String payment_method_id) async {
    TopupModel model;
//    String param = 'service=Topup.topup&uid=$uid&token=$token&goods_id=$goods_id&payment_method_id=$payment_method_id';
//    var r = await ApiHelper.httpGet(param, cached: false);
//    if (r != null) model = TopupModel(r);
    return model;
  }

}