class UserListModel {
  List<Users> _users;
  Paged _paged;
  int _errorCode;

  UserListModel({List<Users> users, Paged paged, int errorCode}) {
    this._users = users;
    this._paged = paged;
    this._errorCode = errorCode;
  }

  List<Users> get users => _users;
  set users(List<Users> users) => _users = users;
  Paged get paged => _paged;
  set paged(Paged paged) => _paged = paged;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  UserListModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      _users = new List<Users>();
      json['users'].forEach((v) {
        _users.add(new Users.fromJson(v));
      });
    }
    _paged = json['paged'] != null ? new Paged.fromJson(json['paged']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._users != null) {
      data['users'] = this._users.map((v) => v.toJson()).toList();
    }
    if (this._paged != null) {
      data['paged'] = this._paged.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class Users {
  int _id;
  int _age;
  Rank _rank;
  int _gender;
  String _username;
  String _nickname;
  String _mobile;
  String _avatar;
  bool _mobileBinded;
  int _joinedAt;
  bool _isAuth;
  bool _isCompleted;

  Users(
      {int id,
        int age,
        Rank rank,
        int gender,
        String username,
        String nickname,
        String mobile,
        String avatar,
        bool mobileBinded,
        int joinedAt,
        bool isAuth,
        bool isCompleted}) {
    this._id = id;
    this._age = age;
    this._rank = rank;
    this._gender = gender;
    this._username = username;
    this._nickname = nickname;
    this._mobile = mobile;
    this._avatar = avatar;
    this._mobileBinded = mobileBinded;
    this._joinedAt = joinedAt;
    this._isAuth = isAuth;
    this._isCompleted = isCompleted;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get age => _age;
  set age(int age) => _age = age;
  Rank get rank => _rank;
  set rank(Rank rank) => _rank = rank;
  int get gender => _gender;
  set gender(int gender) => _gender = gender;
  String get username => _username;
  set username(String username) => _username = username;
  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;
  String get mobile => _mobile;
  set mobile(String mobile) => _mobile = mobile;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  bool get mobileBinded => _mobileBinded;
  set mobileBinded(bool mobileBinded) => _mobileBinded = mobileBinded;
  int get joinedAt => _joinedAt;
  set joinedAt(int joinedAt) => _joinedAt = joinedAt;
  bool get isAuth => _isAuth;
  set isAuth(bool isAuth) => _isAuth = isAuth;
  bool get isCompleted => _isCompleted;
  set isCompleted(bool isCompleted) => _isCompleted = isCompleted;

  Users.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _age = json['age'];
    _rank = json['rank'] != null ? new Rank.fromJson(json['rank']) : null;
    _gender = json['gender'];
    _username = json['username'];
    _nickname = json['nickname'];
    _mobile = json['mobile'];
    _avatar = json['avatar'];
    _mobileBinded = json['mobile_binded'];
    _joinedAt = json['joined_at'];
    _isAuth = json['is_auth'];
    _isCompleted = json['is_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['age'] = this._age;
    if (this._rank != null) {
      data['rank'] = this._rank.toJson();
    }
    data['gender'] = this._gender;
    data['username'] = this._username;
    data['nickname'] = this._nickname;
    data['mobile'] = this._mobile;
    data['avatar'] = this._avatar;
    data['mobile_binded'] = this._mobileBinded;
    data['joined_at'] = this._joinedAt;
    data['is_auth'] = this._isAuth;
    data['is_completed'] = this._isCompleted;
    return data;
  }
}

class Rank {
  int _id;
  String _name;
  String _desc;
  int _scoreMin;
  int _scoreMax;

  Rank({int id, String name, String desc, int scoreMin, int scoreMax}) {
    this._id = id;
    this._name = name;
    this._desc = desc;
    this._scoreMin = scoreMin;
    this._scoreMax = scoreMax;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  int get scoreMin => _scoreMin;
  set scoreMin(int scoreMin) => _scoreMin = scoreMin;
  int get scoreMax => _scoreMax;
  set scoreMax(int scoreMax) => _scoreMax = scoreMax;

  Rank.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _scoreMin = json['score_min'];
    _scoreMax = json['score_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['score_min'] = this._scoreMin;
    data['score_max'] = this._scoreMax;
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
