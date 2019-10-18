import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/concernlist.dart';
import 'package:movie/models/movielist.dart';
class MyApi {

  ///收藏列表
  static Future<MovieListModel> getFavoritesList(String uid, {int page = 1}) async {
    MovieListModel model;
    String param = 'service=User.getCollectVideos&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieListModel(r);
    return model;
  }

  ///关注列表
  static Future<ConcernListModel> getFollowsList(String uid, String touid, {int page = 1}) async {
    ConcernListModel model;
    String param = 'service=User.getFollowsList&uid=$uid&touid=$touid&p=$page&key=';
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