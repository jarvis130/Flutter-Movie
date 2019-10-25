import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/review.dart';
import 'package:movie/models/swiperlist.dart';
class ReviewApi {

  /// 评论列表
  static Future<ReviewModel> getGetComments(var uid, var videoid, {page = 1}) async {
    ReviewModel model;
    String param = 'service=Video.GetComments&uid=$uid&videoid=$videoid&p=$page';
    var r = await ApiHelper.httpGet(param, cached: false);
    if (r != null) model = ReviewModel(r);
    return model;
  }

}