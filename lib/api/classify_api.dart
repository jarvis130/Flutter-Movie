import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/classify_list_model.dart';
import 'package:movie/models/videolist.dart';
class ClassifyApi {

  ///
  static Future<ClassifyListModel> getClassifyList() async {
    ClassifyListModel model;
    String param = 'service=Video.GetClassifyList';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = ClassifyListModel(r);
    return model;
  }

 ///
 static Future<VideoListModel> getClassifyVideoList(String uid, String classifyId, int page) async {
    VideoListModel model;
    String param = 'service=Video.GetClassifyVideoList&uid=$uid&classify=$classifyId&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = VideoListModel(r);
    return model;
  }

}