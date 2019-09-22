import 'dart:convert' show json;

class ClassifyListModel {

  List<ClassifyListResult> results;

  ClassifyListModel.fromParams({this.results});

  factory ClassifyListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ClassifyListModel.fromJson(json.decode(jsonStr)) : new ClassifyListModel.fromJson(jsonStr);
  
  ClassifyListModel.fromJson(jsonRes) {
    results = jsonRes['data']['info'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
            results.add(resultsItem == null ? null : new ClassifyListResult.fromJson(resultsItem));
    }
  }

  // @override
  // String toString() {
  //   return '{"page": $page,"total_pages": $totalPages,"total_results": $totalResults,"results": $results}';
  // }
}

class ClassifyListResult {

  String id;
  String title;
  String img_url;

  ClassifyListResult.fromParams({this.id, this.title, this.img_url});
  
  ClassifyListResult.fromJson(jsonRes) {
    id = jsonRes['id'];
    title = jsonRes['title'];
    img_url = jsonRes['img_url'];
  }

  // @override
  // String toString() {
  //   return '{"adult": $adult,"featured": $featured,"id": $id,"number_of_items": $numberOfItems,"public": $public,"runtime": $runtime,"sort_by": $sortBy,"average_rating": $averageRating,"backdrop_path": ${backdropPath != null?'${json.encode(backdropPath)}':'null'},"created_at": ${createdAt != null?'${json.encode(createdAt)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"iso_3166_1": ${iso31661 != null?'${json.encode(iso31661)}':'null'},"iso_639_1": ${iso6391 != null?'${json.encode(iso6391)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"poster_path": ${posterPath != null?'${json.encode(posterPath)}':'null'},"revenue": ${revenue != null?'${json.encode(revenue)}':'null'},"updated_at": ${updatedAt != null?'${json.encode(updatedAt)}':'null'},"selected":$selected}';
  // }
}

