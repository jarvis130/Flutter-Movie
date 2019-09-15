import 'dart:convert' show json;

import 'package:fish_redux/fish_redux.dart';

class SwiperListModel {

  List< SwiperListResult> results;

  SwiperListModel.fromParams({this.results});

  factory SwiperListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SwiperListModel.fromJson(json.decode(jsonStr)) : new SwiperListModel.fromJson(jsonStr);

  SwiperListModel.fromJson(jsonRes) {

    results = jsonRes['data']['info'] == null ? null : [];
    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
      results.add(resultsItem == null ? null : new SwiperListResult.fromJson(resultsItem));
    }

  }

  @override
  String toString() {
    return '{"results": $results}';
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

class SwiperListResult {

  String id;
  String url;
  String type;
  String redirection;
  String addtime;


  SwiperListResult.fromParams({this.id, this.url, this.type, this.redirection, this.addtime});

  SwiperListResult.fromJson(jsonRes) {
    id = jsonRes['id'];
    url = jsonRes['url'];
    type = jsonRes['type'];
    redirection = jsonRes['redirection'];
    addtime = jsonRes['addtime'];
  }

  @override
  String toString() {
    return '{"id": $id, "url": $url, "type":$type, "redirection": $redirection, "addtime": $addtime}';
  }
}

