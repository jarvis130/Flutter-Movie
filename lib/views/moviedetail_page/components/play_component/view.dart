import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/videoplayeritem.dart';
import 'package:video_player/video_player.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(PlayState state, Dispatch dispatch, ViewService viewService) {

  if (state.movieDetailModel.product == null) {
      return Container(
      );
  } else {
    // String url = state.href;
    // return VideoWidget(url);

    return VideoPlayerItem(
       vc: VideoPlayerController.network(state.movieDetailModel.product.videoUrl),
       coverurl: state.movieDetailModel.product.defaultPhoto.thumb,
       showplayer: true,
     );
  }
  
}
