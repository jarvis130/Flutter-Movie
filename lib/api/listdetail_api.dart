import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/listdetailmodel.dart';
class ListDetailApi {

  ///
  static Future<ListDetailModel> getUserHome(String uid) async {
    ListDetailModel model;
    String param = 'service=User.GetUserHome&touid=$uid&uid=';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = ListDetailModel(r);
    return model;
  }

}