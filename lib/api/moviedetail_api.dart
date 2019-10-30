import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/moviedetail.dart';
class MoiveDetailApi {

  ///视频详情
  static Future<MovieDetailModel> getMovieDetail(var uid, var movieId) async {
    MovieDetailModel model;
    String param = 'service=Video.GetVideo&uid=$uid&videoid=$movieId';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieDetailModel(r);
    return model;
  }
  
  ///检查观看次数
   static Future<MovieDetailModelReturn> getMovieDetailData(var uid, var movieId) async {
    MovieDetailModelReturn model;
    String param = 'service=Video.GetVideo&uid=$uid&videoid=$movieId';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieDetailModelReturn(r);
    return model;
  }

    ///增加观看次数
   static Future<MovieDetailModelReturn> addView(var uid, var token, var movieId) async {
    MovieDetailModelReturn model;
    String param = 'service=Video.AddView&uid=$uid&videoid=$movieId&token=$token';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieDetailModelReturn(r);
    return model;
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