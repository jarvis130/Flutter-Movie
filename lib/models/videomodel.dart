import 'dart:convert' show json;

class VideoModel {

  int id;
  List<VideoResult> results;

  VideoModel.fromParams({this.id, this.results});

  factory VideoModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoModel.fromJson(json.decode(jsonStr)) : new VideoModel.fromJson(jsonStr);
  
  VideoModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    results = jsonRes['results'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['results']){
            results.add(resultsItem == null ? null : new VideoResult.fromJson(resultsItem));
    }
  }

  @override
  String toString() {
    return '{"id": $id,"results": $results}';
  }
}

class VideoResult {

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
// String userinfo" -> Map (16 items)

  VideoResult.fromParams({
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
  
  VideoResult.fromJson(jsonRes) {
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
  }

  // @override
  // String toString() {
  //   return '{"size": $size,"id": ${id != null?'${json.encode(id)}':'null'},"iso_3166_1": ${iso_3166_1 != null?'${json.encode(iso_3166_1)}':'null'},"iso_639_1": ${iso_639_1 != null?'${json.encode(iso_639_1)}':'null'},"key": ${key != null?'${json.encode(key)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"site": ${site != null?'${json.encode(site)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'}}';
  // }
}

