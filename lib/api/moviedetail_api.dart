import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/moviedetail.dart';
class MoiveDetailApi {

  ///
  static Future<MovieDetailModel> getMovieDetail(var uid, var movieId) async {
    MovieDetailModel model;
    String param = 'service=Video.GetVideo&uid=$uid&videoid=$movieId';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieDetailModel(r);
    return model;
  }

   static Future<String> getMovieDetailData(var uid, var movieId) async {
    String param = 'service=Video.GetVideo&uid=$uid&videoid=$movieId';
    var r = await ApiHelper.httpGet(param, cached: false);
    return r;
  }

  ///收藏
  static Future<MovieDetailModel> addCollect(var uid, var token, var videoid) async {
    MovieDetailModel model;
    String param = 'service=Video.AddCollect&uid=$uid&videoid=$videoid&token=$token';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieDetailModel(r);
    return model;
  }

    ///关注
  static Future<MovieDetailModel> setAttent(var uid, var token, var touid) async {
    MovieDetailModel model;
    String param = 'service=User.SetAttent&uid=$uid&touid=$touid&token=$token';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieDetailModel(r);
    return model;
  }
}