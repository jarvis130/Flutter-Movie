import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MenuAction {
  action,
  setRating,
  updateRating,
  setFavorite,
  updateFavorite,
  setAttention,
  updateAttention
}

class MenuActionCreator {
  static Action onAction() {
    return const Action(MenuAction.action);
  }

  static Action setRating(double d) {
    return Action(MenuAction.setRating, payload: d);
  }

  static Action updateRating(double d) {
    return Action(MenuAction.updateRating, payload: d);
  }

  static Action setFavorite(int isFavorite) {
    return Action(MenuAction.setFavorite, payload: isFavorite);
  }

  static Action updateFavorite(int isFavorite) {
    return Action(MenuAction.updateFavorite, payload: isFavorite);
  }
  static Action setAttention(int pubId) {
    return Action(MenuAction.setAttention, payload: pubId);
  }

  static Action updateAttention(int isAttention) {
    return Action(MenuAction.updateAttention, payload: isAttention);
  }
}
