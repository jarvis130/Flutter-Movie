import 'dart:convert' show json;

import 'package:fish_redux/fish_redux.dart';

class MovieListModel {

  int page;
  int total_pages;
  int total_results;
  List< MovieListResult> results;
  DateString dates;

  MovieListModel.fromParams({this.page, this.total_pages, this.total_results, this.results, this.dates});

  factory MovieListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new MovieListResult.fromJson(json.decode(jsonStr)) : new MovieListModel.fromJson(jsonStr);

  MovieListModel.fromJson(jsonRes) {
    println('1111');
//    page = jsonRes['page'];
//    total_pages = jsonRes['total_pages'];
//    total_results = jsonRes['total_results'];
    results = jsonRes['data']['info'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
            results.add(resultsItem == null ? null : new MovieListResult.fromJson(resultsItem));
    }

    dates = jsonRes['dates'] == null ? null : new DateString.fromJson(jsonRes['dates']);
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

  @override
  String toString() {
    return '{"maximum": ${maximum != null?'${json.encode(maximum)}':'null'},"minimum": ${minimum != null?'${json.encode(minimum)}':'null'}}';
  }
}

class MovieListResult {

  int id;
  String datetime;
  String islike;
  String iscollect;
  String isattent;
  String thumb_s;
  String comments;
  String likes;
  String collects;

  MovieListResult.fromParams({this.id, this.datetime, this.islike, this.iscollect, this.isattent, this.thumb_s, this.comments, this.likes, this.collects});

  MovieListResult.fromJson(jsonRes) {
    id = jsonRes['id'];
    datetime = jsonRes['datetime'];
    islike = jsonRes['islike'];
    iscollect = jsonRes['iscollect'];
    isattent = jsonRes['isattent'];
    thumb_s = jsonRes['thumb_s'];
    comments = jsonRes['comments'];
    likes = jsonRes['likes'];
    collects = jsonRes['collects'];

//    for (var genre_idsItem in genre_ids == null ? [] : jsonRes['genre_ids']){
//            genre_ids.add(genre_idsItem);
//    }
  }

  @override
  String toString() {
    return '{"id": $id, "datetime": $datetime, "islike": $islike, "iscollect":$iscollect, "isattent": $isattent, "thumb_s": $thumb_s, "comments": $comments, "likes": $likes, "collects": $collects}';
  }
}

