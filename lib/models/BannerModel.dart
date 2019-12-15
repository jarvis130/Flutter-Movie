class BannerModel {
  List<Banners> _banners;
  int _errorCode;

  BannerModel({List<Banners> banners, int errorCode}) {
    this._banners = banners;
    this._errorCode = errorCode;
  }

  List<Banners> get banners => _banners;
  set banners(List<Banners> banners) => _banners = banners;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      _banners = new List<Banners>();
      json['banners'].forEach((v) {
        _banners.add(new Banners.fromJson(v));
      });
    }
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._banners != null) {
      data['banners'] = this._banners.map((v) => v.toJson()).toList();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Banners {
  int _id;
  Photo _photo;
  String _link;
  String _title;
  String _sort;

  Banners({int id, Photo photo, String link, String title, String sort}) {
    this._id = id;
    this._photo = photo;
    this._link = link;
    this._title = title;
    this._sort = sort;
  }

  int get id => _id;
  set id(int id) => _id = id;
  Photo get photo => _photo;
  set photo(Photo photo) => _photo = photo;
  String get link => _link;
  set link(String link) => _link = link;
  String get title => _title;
  set title(String title) => _title = title;
  String get sort => _sort;
  set sort(String sort) => _sort = sort;

  Banners.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    _link = json['link'];
    _title = json['title'];
    _sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._photo != null) {
      data['photo'] = this._photo.toJson();
    }
    data['link'] = this._link;
    data['title'] = this._title;
    data['sort'] = this._sort;
    return data;
  }
}

class Photo {
  Null _width;
  Null _height;
  String _thumb;
  String _large;

  Photo({Null width, Null height, String thumb, String large}) {
    this._width = width;
    this._height = height;
    this._thumb = thumb;
    this._large = large;
  }

  Null get width => _width;
  set width(Null width) => _width = width;
  Null get height => _height;
  set height(Null height) => _height = height;
  String get thumb => _thumb;
  set thumb(String thumb) => _thumb = thumb;
  String get large => _large;
  set large(String large) => _large = large;

  Photo.fromJson(Map<String, dynamic> json) {
    _width = json['width'];
    _height = json['height'];
    _thumb = json['thumb'];
    _large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this._width;
    data['height'] = this._height;
    data['thumb'] = this._thumb;
    data['large'] = this._large;
    return data;
  }
}
