import 'package:flutter/cupertino.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserListModel.dart';

class FavoritesState extends ChangeNotifier {

  GoodProducts _favoritesGoods;
  UserListModel _attentionUser;

  void setFavoritesGoods(GoodProducts favoritesGoods) {
    _favoritesGoods = favoritesGoods;
    notifyListeners();
  }
  get favoritesGoods => _favoritesGoods;

  void setAttentionUser(UserListModel attentionUser) {
    _attentionUser = attentionUser;
    notifyListeners();
  }
  get attentionUser => _attentionUser;
}