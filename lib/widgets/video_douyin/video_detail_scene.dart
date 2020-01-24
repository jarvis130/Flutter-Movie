import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'video_widget.dart';

class VideoDouyuDetailScene extends StatefulWidget {

  static int firstInitTimes=1;

  @override
  State<StatefulWidget> createState() => VideoDouyuDetailState();
}

class VideoDouyuDetailState extends State<VideoDouyuDetailScene> {
  SwiperController _controller = SwiperController();

  @override
  void dispose() {
    super.dispose();
    VideoDouyuDetailScene.firstInitTimes = 1;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page.floor() == _controller.page) {
//        eventBus.emit(
//            EventVideoPlayPosition + _controller.page.floor().toString(),
//            _controller.page.floor());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.generate(20, (i) => buildVideoItem(i));
    return Scaffold(
        body: Swiper(
      autoStart: false,
      circular: false,
      direction: Axis.vertical,
      children: children,
      controller: _controller,
    ));
  }

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
}
