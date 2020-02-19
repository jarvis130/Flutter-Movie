import 'package:flutter/cupertino.dart';

class UserState extends ChangeNotifier {
  int _userId;
  String _username;
  String _avatar;
  String _rank;
  String _watchTimes;
  String _watchedTimes;

  void setUserId(int userId) {
    _userId = userId;
    notifyListeners();
  }
  get userId => _userId;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }
  get username => _username;

  void setAvatar(String avatar) {
    _avatar = avatar;
    notifyListeners();
  }
  get avatar => _avatar;

  void setRank(String rank) {
    _rank = rank;
    notifyListeners();
  }
  get rank => _rank;

  void setWatchTimes(String watchTimes) {
    _watchTimes = watchTimes;
    notifyListeners();
  }
  get watchTimes => _watchTimes;

  void setWatchedTimes(String watchedTimes) {
    _watchedTimes = watchedTimes;
    notifyListeners();
  }
  get watchedTimes => _watchedTimes;
}