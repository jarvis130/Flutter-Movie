import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/imagemodel.dart';
import 'package:movie/models/media_accountstatemodel.dart';
import 'package:movie/models/moviedetail.dart';

//TODO replace with your own action
enum DetailPageAction {
  action,
  updateDetail,
  setImages,
  playTrailer,
  externalTapped,
  stillImageTapped,
  movieCellTapped,
  castCellTapped,
  setAccountState,
  openMenu,
  showSnackBar
}

class DetailPageActionCreator {
  static Action onAction() {
    return const Action(DetailPageAction.action);
  }

  static Action updateDetail(MovieDetailModel d) {
    return Action(DetailPageAction.updateDetail, payload: d);
  }

  static Action onSetImages(ImageModel c) {
    return Action(DetailPageAction.setImages, payload: c);
  }

  static Action playTrailer() {
    return const Action(DetailPageAction.playTrailer);
  }

  static Action onExternalTapped(String url) {
    return Action(DetailPageAction.externalTapped, payload: url);
  }

  static Action stillImageTapped(int index) {
    return Action(DetailPageAction.stillImageTapped, payload: index);
  }

  static Action movieCellTapped(String id, String bgurl) {
    return Action(DetailPageAction.movieCellTapped, payload: [id, bgurl]);
  }

  static Action castCellTapped(
      int id, String profilePath, String profileName, String character) {
    return Action(DetailPageAction.castCellTapped,
        payload: [id, profilePath, profileName, character]);
  }

  static Action onSetAccountState(MediaAccountStateModel model) {
    return Action(DetailPageAction.setAccountState, payload: model);
  }

  static Action openMenu() {
    return Action(DetailPageAction.openMenu);
  }

  static Action showSnackBar(String message) {
    return Action(DetailPageAction.showSnackBar, payload: message);
  }
}
