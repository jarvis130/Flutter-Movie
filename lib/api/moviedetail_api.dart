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

}