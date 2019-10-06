import 'dart:convert' show json;

class ConcernListModel {

  int page;
  int total_pages;
  int total_results;
  List< ConcernListResult> results;
  DateString dates;

  ConcernListModel.fromParams({this.page, this.total_pages, this.total_results, this.results, this.dates});

  factory ConcernListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ConcernListModel.fromJson(json.decode(jsonStr)) : new ConcernListModel.fromJson(jsonStr);
  
  ConcernListModel.fromJson(jsonRes) {
    // page = jsonRes['page'];
    // total_pages = jsonRes['total_pages'];
    // total_results = jsonRes['total_results'];
    results = jsonRes['data']['info'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
            results.add(resultsItem == null ? null : new ConcernListResult.fromJson(resultsItem));
    }

    // dates = jsonRes['dates'] == null ? null : new DateString.fromJson(jsonRes['dates']);
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

class ConcernListResult {

  String likes;
  String comments;
  String collects;
  String datetime;
  String islike;
  String iscollect;
  Map userinfo;

  ConcernListResult.fromParams({
    this.likes,
    this.comments,  
    this.collects,
    this.datetime,
    this.islike,
    this.iscollect,
    this.userinfo
  });

  ConcernListResult.fromJson(jsonRes) {

    this.likes = jsonRes['likes'];
    this.comments = jsonRes['comments'];
    this.collects = jsonRes['collects'];
    this.datetime = jsonRes['datetime'];
    this.islike = jsonRes['islike'];
    this.iscollect = jsonRes['iscollect'];
    this.userinfo = jsonRes['userinfo'];
  }

  // @override
  // String toString() {
  //   return '{"id": $id,"rating": $rating,"mediaType":$mediaType,"vote_count": $vote_count,"popularity": $popularity,"vote_average": $vote_average,"adult": $adult,"video": $video,"backdrop_path": ${backdrop_path != null?'${json.encode(backdrop_path)}':'null'},"original_language": ${original_language != null?'${json.encode(original_language)}':'null'},"original_title": ${original_title != null?'${json.encode(original_title)}':'null'},"overview": ${overview != null?'${json.encode(overview)}':'null'},"poster_path": ${poster_path != null?'${json.encode(poster_path)}':'null'},"release_date": ${release_date != null?'${json.encode(release_date)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"genre_ids": $genre_ids,"first_air_date": ${first_air_date != null?'${json.encode(first_air_date)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"original_language": ${original_language != null?'${json.encode(original_language)}':'null'},"original_name": ${original_name != null?'${json.encode(original_name)}':'null'},"origin_country": $origin_country}';
  // }
}

