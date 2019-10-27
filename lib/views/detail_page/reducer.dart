import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/imagemodel.dart';
import 'package:movie/models/media_accountstatemodel.dart';
import 'package:movie/models/moviedetail.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailPageState>>{
      DetailPageAction.action: _onAction,
      DetailPageAction.updateDetail: _updateDetail,
      DetailPageAction.setImages: _onSetImages,
      DetailPageAction.setAccountState: _onSetAccountState
    },
  );
}

DetailPageState _onAction(DetailPageState state, Action action) {
  final DetailPageState newState = state.clone();
  return newState;
}

DetailPageState _updateDetail(DetailPageState state, Action action) {
  final MovieDetailModel model = action.payload;
  final DetailPageState newState = state.clone();
  newState.detail = model;
  if (newState.bgPic == null) newState.bgPic = model.thumb_s;
  return newState;
}

DetailPageState _onSetImages(DetailPageState state, Action action) {
  ImageModel c = action.payload;
  final DetailPageState newState = state.clone();
  newState.imagesmodel = c;
  return newState;
}

DetailPageState _onSetAccountState(
    DetailPageState state, Action action) {
  MediaAccountStateModel c = action.payload;
  final DetailPageState newState = state.clone();
  newState.accountState = c;
  return newState;
}
