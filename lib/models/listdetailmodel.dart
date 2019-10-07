import 'dart:convert' show json;

class ListDetailModel {

  String id;
  int page;
  int totalPages;
  int totalResults;
  String user_nicename;
  String avatar;
  String avatar_thumb;
  String sex ;
  String signature;
  String province;
  String city;
  String birthday ;
  String age;
  String praise;
  String fans;
  String follows ;
  String workVideos;
  String likeVideos;
  String vip_info ;
  String isattention;
  List<ListDetailResult> results;

  ListDetailModel.fromParams({this.id, this.page, this.totalPages, this.totalResults, this.user_nicename, this.avatar, this.avatar_thumb, this.sex, this.signature, this.province, this.city, this.birthday, this.age, this.praise, this.fans, this.follows, this.workVideos, this.likeVideos, this.vip_info, this.isattention, this.results});

  factory ListDetailModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ListDetailModel.fromJson(json.decode(jsonStr)) : new ListDetailModel.fromJson(jsonStr);
  
  ListDetailModel.fromJson(jsonRes) {
    var tmp = jsonRes['data']['info'];
    this.id = tmp['id'];
    this.user_nicename = tmp['user_nicename'];
    this.avatar = tmp['avatar'];
    this.avatar_thumb = tmp['avatar_thumb'];
    this.sex  = tmp['sex'];
    this.signature = tmp['signature'];
    this.province = tmp['province'];
    this.city = tmp['city'];
    this.birthday = tmp['birthday'];
    this.age = tmp['age'];
    this.praise = tmp['praise'];
    this.fans = tmp['fans'];
    this.follows  = tmp['follows'];
    this.workVideos = tmp['workVideos'];
    this.likeVideos = tmp['likeVideos'];
    this.vip_info  = tmp['vip_info'];
    this.isattention = tmp['isattention'];

    results = tmp['videos'] == null ? null : [];

    for (var resultsItem in tmp['videos'] == null ? [] : tmp['videos']){
      results.add(resultsItem == null ? null : new ListDetailResult.fromJson(resultsItem));
    }

    //comments = jsonRes['comments'] == null ? null : new Comments.fromJson(jsonRes['comments']);
    // createdBy = jsonRes['created_by'] == null ? null : new CreatedBy.fromJson(jsonRes['created_by']);
    //objectIds = jsonRes['object_ids'] == null ? null : new ObjectIds.fromJson(jsonRes['object_ids']);
  }

  // @override
  // String toString() {
  //   return '{"id": $id,"page": $page,"runtime": $runtime,"total_pages": $totalPages,"total_results": $totalResults,"average_rating": $averageRating,"public": $public,"backdrop_path": ${backdropPath != null?'${json.encode(backdropPath)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"iso_3166_1": ${iso31661 != null?'${json.encode(iso31661)}':'null'},"iso_639_1": ${iso6391 != null?'${json.encode(iso6391)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"poster_path": ${posterPath != null?'${json.encode(posterPath)}':'null'},"revenue": ${revenue != null?'${json.encode(revenue)}':'null'},"results": $results,"comments": $comments,"created_by": $createdBy,"object_ids": $objectIds}';
  // }
}

class ListDetailResult {

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

  ListDetailResult.fromParams({
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

  ListDetailResult.fromJson(jsonRes) {
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
  //   return '{"id": $id,"rating": $rating,"mediaType":$mediaType,"vote_count": $vote_count,"popularity": $popularity,"vote_average": $vote_average,"adult": $adult,"video": $video,"backdrop_path": ${backdrop_path != null?'${json.encode(backdrop_path)}':'null'},"original_language": ${original_language != null?'${json.encode(original_language)}':'null'},"original_title": ${original_title != null?'${json.encode(original_title)}':'null'},"overview": ${overview != null?'${json.encode(overview)}':'null'},"poster_path": ${poster_path != null?'${json.encode(poster_path)}':'null'},"release_date": ${release_date != null?'${json.encode(release_date)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"genre_ids": $genre_ids,"first_air_date": ${first_air_date != null?'${json.encode(first_air_date)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"original_language": ${original_language != null?'${json.encode(original_language)}':'null'},"original_name": ${original_name != null?'${json.encode(original_name)}':'null'},"origin_country": $origin_country}';
  // }
}

class ObjectIds {
}

class CreatedBy {

  String gravatarHash;
  String name;
  String username;

  CreatedBy.fromParams({this.gravatarHash, this.name, this.username});
  
  CreatedBy.fromJson(jsonRes) {
    gravatarHash = jsonRes['gravatar_hash'];
    name = jsonRes['name'];
    username = jsonRes['username'];
  }

  @override
  String toString() {
    return '{"gravatar_hash": ${gravatarHash != null?'${json.encode(gravatarHash)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"username": ${username != null?'${json.encode(username)}':'null'}}';
  }
}

class Comments {
}



