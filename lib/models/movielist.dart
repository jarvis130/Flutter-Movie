import 'dart:convert' show json;

import 'package:fish_redux/fish_redux.dart';

class MovieListModel {

  int page;
  int total_pages;
  int total_results;
  List< MovieListResult> results;
  DateString dates;

  MovieListModel.fromParams({this.results});

  factory MovieListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new MovieListModel.fromJson(json.decode(jsonStr)) : new MovieListModel.fromJson(jsonStr);

  MovieListModel.fromJson(jsonRes) {
//    page = jsonRes['page'];
//    total_pages = jsonRes['total_pages'];
//    total_results = jsonRes['total_results'];
    results = jsonRes['data']['info'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
            results.add(resultsItem == null ? null : new MovieListResult.fromJson(resultsItem));
    }

  }

  @override
  String toString() {
    return '{"page": $page,"total_pages": $total_pages,"total_results": $total_results,"results": $results,"dates": $dates}';
  }
}

class DateString {

  String maximum;
  String minimum;

  DateString.fromParams({this.maximum, this.minimum});
  
  DateString.fromJson(jsonRes) {
    maximum = jsonRes['maximum'];
    minimum = jsonRes['minimum'];
  }

  // @override
  // String toString() {
  //   return '{"maximum": ${maximum != null?'${json.encode(maximum)}':'null'},"minimum": ${minimum != null?'${json.encode(minimum)}':'null'}}';
  // }
}

class MovieListResult {

  int id;
  String uid;
  String title;
  String thumb;
  String thumb_s;
  String href;
  String likes;
  String views;
  String comments;
  String steps;
  String shares;
  String addtime;
  String lat;
  String lng;
  String city;
  String isdel;
  String status;
  String music_id;
  String xiajia_reason;
  String show_val;
  String nopass_time;
  String watch_ok;
  String is_ad;
  String ad_endtime;
  String ad_url;
  String orderno;
  String wmk_thumb;
  String wmk_href;
  String classify_id;
  String collects;
  String description;
  String datetime;
  int islike;
  int isstep;
  int isattent;
  int iscollect;
// 37: "musicinfo" -> Map 
// String userinfo" -> Map (16 items)


  MovieListResult.fromParams({
    this.id,
    this.uid,
    this.title,
    this.thumb,
    this.thumb_s,
    this.href,
    this.likes,
    this.views,
    this.comments,
    this.steps,
    this.shares,
    this.addtime,
    this.lat,
    this.lng,
    this.city,
    this.isdel,
    this.status,
    this.music_id,
    this.xiajia_reason,
    this.show_val,
    this.nopass_time,
    this.watch_ok,
    this.is_ad,
    this.ad_endtime,
    this.ad_url,
    this.orderno,
    this.wmk_thumb,
    this.wmk_href,
    this.classify_id,
    this.collects,
    this.description,
    this.datetime,
    this.islike,
    this.isstep,
    this.isattent,
    this.iscollect,
  });

  MovieListResult.fromJson(jsonRes) {
    this.id = int.parse(jsonRes['id']);
    this.uid = jsonRes['uid'];
    this.title = jsonRes['title'];
    this.thumb = jsonRes['thumb'];
    this.thumb_s = jsonRes['thumb_s'];
    this.href = jsonRes['href'];
    this.likes = jsonRes['likes'];
    this.views = jsonRes['views'];
    this.comments = jsonRes['comments'];
    this.steps = jsonRes['steps'];
    this.shares = jsonRes['shares'];
    this.addtime = jsonRes['addtime'];
    this.lat = jsonRes['lat'];
    this.lng = jsonRes['lng'];
    this.city = jsonRes['city'];
    this.isdel = jsonRes['isdel'];
    this.status = jsonRes['status'];
    this.music_id = jsonRes['music_id'];
    this.xiajia_reason = jsonRes['xiajia_reason'];
    this.show_val = jsonRes['show_val'];
    this.nopass_time = jsonRes['nopass_time'];
    this.watch_ok = jsonRes['watch_ok'];
    this.is_ad = jsonRes['is_ad'];
    this.ad_endtime = jsonRes['ad_endtime'];
    this.ad_url = jsonRes['ad_url'];
    this.orderno = jsonRes['orderno'];
    this.wmk_thumb = jsonRes['wmk_thumb'];
    this.wmk_href = jsonRes['wmk_href'];
    this.classify_id = jsonRes['classify_id'];
    this.collects = jsonRes['collects'];
    this.description = jsonRes['description'];
    this.datetime = jsonRes['datetime'];
    // this.islike = jsonRes['islike'];
    // this.isstep = jsonRes['isstep'];
    // this.isattent = jsonRes['isattent'];
    // this.iscollect = jsonRes['iscollect'];

//    for (var genre_idsItem in genre_ids == null ? [] : jsonRes['genre_ids']){
//            genre_ids.add(genre_idsItem);
//    }
  }

  // @override
  // String toString() {
  //   return '{"id": $id, "datetime": $datetime, "islike": $islike, "iscollect":$iscollect, "isattent": $isattent, "thumb_s": $thumb_s, "comments": $comments, "likes": $likes, "collects": $collects}';
  // }
}

