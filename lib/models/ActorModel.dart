
import 'package:movie/models/ProductModel.dart';

class ActorModel {
  List<Actor> _actor;
  Paged _paged;
  int _errorCode;

  ActorModel({List<Actor> actor, Paged paged, int errorCode}) {
    this._actor = actor;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  List<Actor> get actor => _actor;
  set actor(List<Actor> actor) => _actor = actor;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  ActorModel.fromJson(Map<String, dynamic> json) {
    if (json['actor'] != null) {
      _actor = new List<Actor>();
      json['actor'].forEach((v) {
        _actor.add(new Actor.fromJson(v));
      });
    }
    _paged = json['paged'] != null ? new Paged.fromJson(json['paged']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._actor != null) {
      data['actor'] = this._actor.map((v) => v.toJson()).toList();
    }
    if (this._paged != null) {
      data['paged'] = this._paged.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Actor {
  int _actorId;
  String _actorName;
  String _country;
  String _actorDesc;
  String _actorAvatar;
  int _sortOrder;
  int _isShow;
  int _actinTotal;
  int _isAttention;
  List<Product> _videos;

  Actor(
      {int actorId,
        String actorName,
        String country,
        String actorDesc,
        String actorAvatar,
        int sortOrder,
        int isShow,
        int actinTotal,
        int isAttention,
        List<Product> videos}) {
    this._actorId = actorId;
    this._actorName = actorName;
    this._country = country;
    this._actorDesc = actorDesc;
    this._actorAvatar = actorAvatar;
    this._sortOrder = sortOrder;
    this._isShow = isShow;
    this._actinTotal = actinTotal;
    this._isAttention = isAttention;
    this._videos = videos;
  }

  int get actorId => _actorId;
  set actorId(int actorId) => _actorId = actorId;
  String get actorName => _actorName;
  set actorName(String actorName) => _actorName = actorName;
  String get country => _country;
  set country(String country) => _country = country;
  String get actorDesc => _actorDesc;
  set actorDesc(String actorDesc) => _actorDesc = actorDesc;
  String get actorAvatar => _actorAvatar;
  set actorAvatar(String actorAvatar) => _actorAvatar = actorAvatar;
  int get sortOrder => _sortOrder;
  set sortOrder(int sortOrder) => _sortOrder = sortOrder;
  int get isShow => _isShow;
  set isShow(int isShow) => _isShow = isShow;
  int get actinTotal => _actinTotal;
  set actinTotal(int actinTotal) => _actinTotal = actinTotal;
  int get isAttention => _isAttention;
  set isAttention(int isAttention) => _isAttention = isAttention;
  List<Product> get videos => _videos;
  set videos(List<Product> videos) => _videos = videos;

  Actor.fromJson(Map<String, dynamic> json) {
    _actorId = json['actor_id'];
    _actorName = json['actor_name'];
    _country = json['country'];
    _actorDesc = json['actor_desc'];
    _actorAvatar = json['actor_avatar'];
    _sortOrder = json['sort_order'];
    _isShow = json['is_show'];
    _actinTotal = json['actin_total'];
    _isAttention = json['is_attention'];
    if (json['videos'] != null) {
      _videos = new List<Product>();
      json['videos'].forEach((v) {
        _videos.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actor_id'] = this._actorId;
    data['actor_name'] = this._actorName;
    data['country'] = this._country;
    data['actor_desc'] = this._actorDesc;
    data['actor_avatar'] = this._actorAvatar;
    data['sort_order'] = this._sortOrder;
    data['is_show'] = this._isShow;
    data['actin_total'] = this._actinTotal;
    data['is_attention'] = this._isAttention;
    if (this._videos != null) {
      data['videos'] = this._videos.map((v) => v.toJson()).toList();
    }
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
