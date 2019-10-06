import 'dart:convert' show json;

import 'package:movie/models/releasedatemodel.dart';
import 'package:movie/models/review.dart';
import 'package:movie/models/videolist.dart';
import 'package:movie/models/videomodel.dart';

import 'creditsmodel.dart';
import 'externalidsmodel.dart';
import 'imagemodel.dart';
import 'keyword.dart';

class MovieDetailModel {
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
  String islike;
  String isstep;
  String isattent;
  String iscollect;
// 37: "musicinfo" -> Map 
  Map userinfo;
  List recommendations;

  MovieDetailModel.fromParams({
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

  factory MovieDetailModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MovieDetailModel.fromJson((json.decode(jsonStr))['data']['info'])
          : new MovieDetailModel.fromJson(jsonStr);

  MovieDetailModel.fromJson(jsonRes) {
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
  }

  // @override
  // String toString() {
  //   return '{"homepage": $homepage,"budget": $budget,"id": $id,"revenue": $revenue,"runtime": $runtime,"vote_count": $vote_count,"popularity": $popularity,"vote_average": $vote_average,"adult": $adult,"video": $video,"backdrop_path": ${backdrop_path != null ? '${json.encode(backdrop_path)}' : 'null'},"imdb_id": ${imdb_id != null ? '${json.encode(imdb_id)}' : 'null'},"original_language": ${original_language != null ? '${json.encode(original_language)}' : 'null'},"original_title": ${original_title != null ? '${json.encode(original_title)}' : 'null'},"overview": ${overview != null ? '${json.encode(overview)}' : 'null'},"poster_path": ${poster_path != null ? '${json.encode(poster_path)}' : 'null'},"release_date": ${release_date != null ? '${json.encode(release_date)}' : 'null'},"status": ${status != null ? '${json.encode(status)}' : 'null'},"tagline": ${tagline != null ? '${json.encode(tagline)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"genres": $genres,"production_companies": $production_companies,"production_countries": $production_countries,"spoken_languages": $spoken_languages,"belongs_to_collection": $belongs_to_collection,"credits": $credits,"images": $images,"keywords": $keywords,"recommendations": $recommendations,"reviews": $reviews,"externalids":$externalids,"releaseDates":$releaseDates,"videos":$videos}';
  // }
}

class BelongsToCollection {
  int id;
  String backdrop_path;
  String name;
  String poster_path;

  BelongsToCollection.fromParams(
      {this.id, this.backdrop_path, this.name, this.poster_path});

  BelongsToCollection.fromJson(jsonRes) {
    id = jsonRes['id'];
    backdrop_path = jsonRes['backdrop_path'];
    name = jsonRes['name'];
    poster_path = jsonRes['poster_path'];
  }

  @override
  String toString() {
    return '{"id": $id,"backdrop_path": ${backdrop_path != null ? '${json.encode(backdrop_path)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"poster_path": ${poster_path != null ? '${json.encode(poster_path)}' : 'null'}}';
  }
}

class SpokenLanguage {
  String iso_639_1;
  String name;

  SpokenLanguage.fromParams({this.iso_639_1, this.name});

  SpokenLanguage.fromJson(jsonRes) {
    iso_639_1 = jsonRes['iso_639_1'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"iso_639_1": ${iso_639_1 != null ? '${json.encode(iso_639_1)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'}}';
  }
}

class ProductionCountrie {
  String iso_3166_1;
  String name;

  ProductionCountrie.fromParams({this.iso_3166_1, this.name});

  ProductionCountrie.fromJson(jsonRes) {
    iso_3166_1 = jsonRes['iso_3166_1'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"iso_3166_1": ${iso_3166_1 != null ? '${json.encode(iso_3166_1)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'}}';
  }
}

class ProductionCompanie {
  int id;
  String logo_path;
  String name;
  String origin_country;

  ProductionCompanie.fromParams(
      {this.id, this.logo_path, this.name, this.origin_country});

  ProductionCompanie.fromJson(jsonRes) {
    id = jsonRes['id'];
    logo_path = jsonRes['logo_path'];
    name = jsonRes['name'];
    origin_country = jsonRes['origin_country'];
  }

  @override
  String toString() {
    return '{"id": $id,"logo_path": ${logo_path != null ? '${json.encode(logo_path)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"origin_country": ${origin_country != null ? '${json.encode(origin_country)}' : 'null'}}';
  }
}

class Genre {
  int id;
  String name;

  Genre.fromParams({this.id, this.name});

  Genre.fromJson(jsonRes) {
    id = jsonRes['id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"id": $id,"name": ${name != null ? '${json.encode(name)}' : 'null'}}';
  }
}
