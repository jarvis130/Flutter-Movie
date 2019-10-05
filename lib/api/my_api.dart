import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/videolist.dart';
class MyApi {

  ///
  static Future<VideoListModel> getFavoritesList(String uid, int page) async {
    VideoListModel model;
    String param = 'service=User.getCollectVideos&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = VideoListModel(r);
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