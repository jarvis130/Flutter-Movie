import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/swiperlist.dart';
import 'package:movie/models/searchresult.dart';

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

  ///新增视频
  static Future<MovieListModel> getNewMovieList(String uid, {int page = 1}) async {
    MovieListModel model;
    String param = 'service=Video.GetNewVideoList&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = MovieListModel(r);
    return model;
  }

  ///搜索
  static Future<SearchResultModel> searchMulit(String query, var uid, {int page = 1, bool searchadult = false}) async {
    SearchResultModel model;
    String param = 'service=Home.VideoSearch&key=$query&uid=$uid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null)
      model = SearchResultModel(r);
    return model;
  }
}