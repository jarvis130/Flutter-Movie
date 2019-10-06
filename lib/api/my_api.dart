import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/concernlist.dart';
import 'package:movie/models/videolist.dart';
class MyApi {

  ///收藏列表
  static Future<VideoListModel> getFavoritesList(String uid, int page) async {
    VideoListModel model;
    String param = 'service=User.getCollectVideos&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = VideoListModel(r);
    return model;
  }

  ///关注列表
  static Future<ConcernListModel> getAttentionVideos(String uid, String token, int page) async {
    ConcernListModel model;
    String param = 'service=User.GetAttentionVideos&uid=$uid&token=$token&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = ConcernListModel(r);
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