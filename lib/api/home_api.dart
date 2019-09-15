import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/swiperlist.dart';
class HomeApi {

  ///轮播图
  static Future<SwiperListModel> getSwiperList() async {
    SwiperListModel model;
    String param = 'service=Home.GetCarouselFigure';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = SwiperListModel(r);
    return model;
  }

  ///热播视频
  static Future<MovieListModel> getHotMovieList(String uid, {int page = 1}) async {
    MovieListModel model;
    String param = 'service=Video.GetVideoList&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieListModel(r);
    return model;
  }

  ///推荐视频
  static Future<MovieListModel> getRecommendMovieList(String uid, {int page = 1}) async {
    MovieListModel model;
    String param = 'service=Video.GetRecommendVideos&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieListModel(r);
    return model;
  }
}