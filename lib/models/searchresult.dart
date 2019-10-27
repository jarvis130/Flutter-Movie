import 'dart:convert' show json;

class SearchResultModel {

  int page;
  int total_pages;
  int total_results;
  List<SearchResult> results;

  SearchResultModel.fromParams({this.page, this.total_pages, this.total_results, this.results});

  factory SearchResultModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SearchResultModel.fromJson(json.decode(jsonStr)) : new SearchResultModel.fromJson(jsonStr);
  
  SearchResultModel.fromJson(jsonRes) {
    page = jsonRes['data']['info']['page'] == null ? 0 : jsonRes['data']['info']['page'];
    total_pages = jsonRes['data']['info']['total_pages'] == null ? 0 : jsonRes['data']['info']['total_pages'];
    total_results = jsonRes['data']['info']['total_results'] == null ? 0 : jsonRes['data']['info']['total_results'];
    results = jsonRes['data']['info']['items'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']['items']){
            results.add(resultsItem == null ? null : new SearchResult.fromJson(resultsItem));
    }
  }

//  @override
//  String toString() {
//    return '{"page": $page,"total_pages": $totalPages,"total_results": $totalResults,"results": $results}';
//  }
}

class SearchResult {

  String id;
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
  var userinfo;

  SearchResult.fromParams({
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
  
  SearchResult.fromJson(jsonRes) {
    this.id = jsonRes['id'];
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
    this.islike = jsonRes['islike'];
    this.isstep = jsonRes['isstep'];
    this.isattent = jsonRes['isattent'];
    this.iscollect = jsonRes['iscollect'];

    this.userinfo = jsonRes['userinfo'];
//    for (var genre_idsItem in genre_ids == null ? [] : jsonRes['genre_ids']){
//            genre_ids.add(genre_idsItem);
//    }
  }

//  @override
//  String toString() {
//    return '{"id": $id,"vote_average": $voteAverage,"vote_count": $voteCount,"popularity": $popularity,"adult": $adult,"video": $video,"backdrop_path": ${backdropPath != null?'${json.encode(backdropPath)}':'null'},"first_air_date": ${firstAirDate != null?'${json.encode(firstAirDate)}':'null'},"media_type": ${mediaType != null?'${json.encode(mediaType)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"original_language": ${originalLanguage != null?'${json.encode(originalLanguage)}':'null'},"original_name": ${originalName != null?'${json.encode(originalName)}':'null'},"original_title": ${originalTitle != null?'${json.encode(originalTitle)}':'null'},"overview": ${overview != null?'${json.encode(overview)}':'null'},"poster_path": ${posterPath != null?'${json.encode(posterPath)}':'null'},"profile_path": ${profilePath != null?'${json.encode(profilePath)}':'null'},"release_date": ${releaseDate != null?'${json.encode(releaseDate)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"genre_ids": $genreIds,"known_for": $knownFor,"origin_country": $originCountry}';
//  }
}


