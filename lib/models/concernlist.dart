import 'dart:convert' show json;

class ConcernListModel {

  int page = 0;
  int total_pages;
  int total_results;
  List< ConcernListResult> results;
  DateString dates;

  ConcernListModel.fromParams({this.page, this.total_pages, this.total_results, this.results, this.dates});

  factory ConcernListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ConcernListModel.fromJson(json.decode(jsonStr)) : new ConcernListModel.fromJson(jsonStr);
  
  ConcernListModel.fromJson(jsonRes) {
    page = jsonRes['data']['info']['page'] == null ? 0 : jsonRes['data']['info']['page'];
    total_pages = jsonRes['data']['info']['total_pages'] == null ? 0 : jsonRes['data']['info']['total_pages'];
    total_results = jsonRes['data']['info']['total_results'] == null ? 0 : jsonRes['data']['info']['total_results'];
    results = jsonRes['data']['info']['items'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']['items']){
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
  String id;
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
  bool vip_info ;
  int isattention;


  ConcernListResult.fromParams({
    this.id,
    this.user_nicename,
    this.avatar,
    this.avatar_thumb,
    this.sex ,
    this.signature,
    this.province,
    this.city,
    this.birthday,
    this.age,
    this.praise,
    this.fans,
    this.follows ,
    this.workVideos,
    this.likeVideos,
    this.vip_info ,
    this.isattention,
  });

  ConcernListResult.fromJson(jsonRes) {
    this.id = jsonRes['id'];
    this.user_nicename = jsonRes['user_nicename'];
    this.avatar = jsonRes['avatar'];
    this.avatar_thumb = jsonRes['avatar_thumb'];
    this.sex  = jsonRes['sex'];
    this.signature = jsonRes['signature'];
    this.province = jsonRes['province'];
    this.city = jsonRes['city'];
    this.birthday = jsonRes['birthday'];
    this.age = jsonRes['age'];
    this.praise = jsonRes['praise'];
    this.fans = jsonRes['fans'];
    this.follows  = jsonRes['follows'];
    this.workVideos = jsonRes['workVideos'];
    this.likeVideos = jsonRes['likeVideos'];
    this.vip_info  = jsonRes['vip_info'];
    this.isattention = jsonRes['isattention'];
  }

  // @override
  // String toString() {
  //   return '{"id": $id,"rating": $rating,"mediaType":$mediaType,"vote_count": $vote_count,"popularity": $popularity,"vote_average": $vote_average,"adult": $adult,"video": $video,"backdrop_path": ${backdrop_path != null?'${json.encode(backdrop_path)}':'null'},"original_language": ${original_language != null?'${json.encode(original_language)}':'null'},"original_title": ${original_title != null?'${json.encode(original_title)}':'null'},"overview": ${overview != null?'${json.encode(overview)}':'null'},"poster_path": ${poster_path != null?'${json.encode(poster_path)}':'null'},"release_date": ${release_date != null?'${json.encode(release_date)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"genre_ids": $genre_ids,"first_air_date": ${first_air_date != null?'${json.encode(first_air_date)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"original_language": ${original_language != null?'${json.encode(original_language)}':'null'},"original_name": ${original_name != null?'${json.encode(original_name)}':'null'},"origin_country": $origin_country}';
  // }
}

