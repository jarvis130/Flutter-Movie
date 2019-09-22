import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/classify_list_model.dart';
class ClassifyApi {

  ///
  static Future<ClassifyListModel> getClassifyList() async {
    ClassifyListModel model;
    String param = 'service=Video.GetClassifyList';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = ClassifyListModel(r);
    return model;
  }

}