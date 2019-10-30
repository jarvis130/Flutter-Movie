import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/customwidgets/video_widget.dart';
import 'package:movie/customwidgets/videoplayeritem.dart';
import 'package:video_player/video_player.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(PlayState state, Dispatch dispatch, ViewService viewService) {

  if (state.href == null) {
      return Container(
      );
  } else {
    // String url = state.href;
    // return VideoWidget(url);
    return VideoPlayerItem(
                         vc: VideoPlayerController.network(state.movieDetailModel.href),
                         coverurl: state.movieDetailModel.thumb_s,
                         showplayer: true,
                       );
  }
  
}
