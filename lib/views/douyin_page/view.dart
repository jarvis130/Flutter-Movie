import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/video_douyin/video_widget.dart';
import 'package:flukit/flukit.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(DouyinPageState state, Dispatch dispatch, ViewService viewService) {

  Widget buildVideoItem(int position) {
    print(position.toString());
    if (position % 2 == 0) {
      return VideoWidget(
        "images/video_1.mp4",
        previewImgUrl: 'images/img_video_1.png',
        positionTag: position,
      );
    } else {
      return VideoWidget(
        "images/video_2.mp4",
        previewImgUrl: 'images/img_video_2.png',
        positionTag: position,
      );
    }
  }

  List<Widget> children = List.generate(20, (i) => buildVideoItem(i));
  return Scaffold(
      body: Swiper(
        autoStart: false,
        circular: false,
        direction: Axis.vertical,
        children: children,
        controller: state.swiperController,
      ));
}
