class UserModel {
  String _token;
  User _user;
  int _errorCode;

  UserModel({String token, User user, int errorCode}) {
    this._token = token;
    this._user = user;
    this._errorCode = errorCode;
  }

  String get token => _token;
  set token(String token) => _token = token;
  User get user => _user;
  set user(User user) => _user = user;
  int get errorCode => _errorCode;
  set errorCode(int errorCode) => _errorCode = errorCode;

  UserModel.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    data['error_code'] = this._errorCode;
    return data;
  }
}

class User {
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
  int _watchTimes;
  int _watchedTimes;

  User(
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
        bool isCompleted,
        int watchTimes,
        int watchedTimes}) {
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
    this._watchTimes = watchTimes;
    this._watchedTimes = watchedTimes;
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

  int get watchTimes => _watchTimes;
  set watchTimes(int watchTimes) => _watchTimes = watchTimes;

  int get watchedTimes => _watchedTimes;
  set watchedTimes(int watchedTimes) => _watchedTimes = watchedTimes;

  User.fromJson(Map<String, dynamic> json) {
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
    _watchedTimes = json['watched_times'];
    _watchTimes = json['watch_times'];
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
    data['watched_times'] = this._watchedTimes;
    data['watch_times'] = this._watchTimes;
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
