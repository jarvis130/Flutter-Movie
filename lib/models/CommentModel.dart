class CommentModel {
  List<Reviews> _reviews;
  Paged _paged;
  int _errorCode;

  CommentModel({List<Reviews> reviews, Paged paged, int errorCode}) {
    this._reviews = reviews;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  List<Reviews> get reviews => _reviews;
  set reviews(List<Reviews> reviews) => _reviews = reviews;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  CommentModel.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      _reviews = new List<Reviews>();
      json['reviews'].forEach((v) {
        _reviews.add(new Reviews.fromJson(v));
      });
    }
    _paged = json['paged'] != null ? new Paged.fromJson(json['paged']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._reviews != null) {
      data['reviews'] = this._reviews.map((v) => v.toJson()).toList();
    }
    if (this._paged != null) {
      data['paged'] = this._paged.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Reviews {
  String _content;
  int _id;
  String _username;
  int _grade;
  int _isAnonymous;
  String _createdAt;
  int _updatedAt;
  String _avatar_url;

  Reviews(
      {String content,
        int id,
        String username,
        int grade,
        int isAnonymous,
        String createdAt,
        int updatedAt,
        String avatar_url}) {
    this._content = content;
    this._id = id;
    this._username = username;
    this._grade = grade;
    this._isAnonymous = isAnonymous;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._avatar_url = avatar_url;
  }

  String get content => _content;
  set content(String content) => _content = content;
  int get id => _id;
  set id(int id) => _id = id;
  String get username => _username;
  set username(String username) => _username = username;
  int get grade => _grade;
  set grade(int grade) => _grade = grade;
  int get isAnonymous => _isAnonymous;
  set isAnonymous(int isAnonymous) => _isAnonymous = isAnonymous;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  int get updatedAt => _updatedAt;
  set updatedAt(int updatedAt) => _updatedAt = updatedAt;
  String get avatar_url => _avatar_url;
  set avatar_url(String avatar_url) => _avatar_url = avatar_url;

  Reviews.fromJson(Map<String, dynamic> json) {
    _content = json['content'];
    _id = json['id'];
    _username = json['username'];
    _grade = json['grade'];
    _isAnonymous = json['is_anonymous'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _avatar_url = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this._content;
    data['id'] = this._id;
    data['username'] = this._username;
    data['grade'] = this._grade;
    data['is_anonymous'] = this._isAnonymous;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['avatar_url'] = this._avatar_url;
    return data;
  }
}

class Paged {
  int _total;
  int _page;
  int _size;
  int _more;

  Paged({int total, int page, int size, int more}) {
    this._total = total;
    this._page = page;
    this._size = size;
    this._more = more;
  }

  int get total => _total;
  set total(int total) => _total = total;
  int get page => _page;
  set page(int page) => _page = page;
  int get size => _size;
  set size(int size) => _size = size;
  int get more => _more;
  set more(int more) => _more = more;

  Paged.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _page = json['page'];
    _size = json['size'];
    _more = json['more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this._total;
    data['page'] = this._page;
    data['size'] = this._size;
    data['more'] = this._more;
    return data;
  }
}
