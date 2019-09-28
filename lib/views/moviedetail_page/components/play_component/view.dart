import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart' as material;
import 'action.dart';
import 'state.dart';

Widget buildView(PlayState state, Dispatch dispatch, ViewService viewService) {

  // var href = state.href==null ? 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4' : state.href;
  if (state.href == null) {
      return Container(
      );
  } else {
    VideoPlayerController videoPlayerController = VideoPlayerController.network(state.href);//'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4'

    return Container(
      child: Chewie(
        controller: ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 3 / 2,
          autoPlay: false,
          looping: false,
          // 拖动条样式颜色
          materialProgressColors: new ChewieProgressColors(
            playedColor: material.Colors.red,
            handleColor: material.Colors.blue,
            backgroundColor: material.Colors.grey,
            bufferedColor: material.Colors.lightGreen,
          ),
        ),
      ),
    );
  }
  
}
