import 'dart:convert' show json;

class ReviewModel {

  int page;
  int total_pages;
  int total_results;
  String videoid;
  int comments;
  List<ReviewResult> commentlist;

  ReviewModel.fromParams({this.videoid, this.page, this.total_pages, this.total_results, this.commentlist});

  factory ReviewModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ReviewModel.fromJson(json.decode(jsonStr)) : new ReviewModel.fromJson(jsonStr);
  
  ReviewModel.fromJson(jsonRes) {
    videoid = jsonRes['data']['info']['videdid'] == null ? '0' : jsonRes['data']['info']['videdid'];
    page = jsonRes['data']['info']['page'] == null ? 0 : jsonRes['data']['info']['page'];
    total_pages = jsonRes['data']['info']['total_pages'] == null ? 0 : jsonRes['data']['info']['total_pages'];
    total_results = jsonRes['data']['info']['total_results'] == null ? 0 : jsonRes['data']['info']['total_results'];
    comments = jsonRes['data']['info']['comments'] == null ? null : 0;
    commentlist = jsonRes['data']['info']['commentlist'] == null ? null : [];

    for (var resultsItem in commentlist == null ? [] : jsonRes['data']['info']['commentlist'] ){
      commentlist.add(resultsItem == null ? null : new ReviewResult.fromJson(resultsItem));
    }
  }

  @override
  String toString() {
    return '{"page": $page,"total_pages": $total_pages,"total_results": $total_results,"commentlist": $commentlist}';
  }
}

class ReviewResult {

  String id;
  String uid;
  String videoid;
  String content;
  String addtime;
  String datetime;
  var userinfo;

  ReviewResult.fromParams({this.id, this.content, this.uid, this.videoid, this.addtime, this.datetime, this.userinfo});
  
  ReviewResult.fromJson(jsonRes) {
    id = jsonRes['id'];
    content = jsonRes['content'];
    uid = jsonRes['uid'];
    videoid = jsonRes['videoid'];
    addtime = jsonRes['addtime'];
    datetime = jsonRes['datetime'];
    userinfo = jsonRes['userinfo'];
  }

//  @override
//  String toString() {
//    return '{"author": ${author != null?'${json.encode(author)}':'null'},"content": ${content != null?'${json.encode(content)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
//  }
}

