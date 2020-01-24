import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';

//  final videoPlayerController = VideoPlayerController.network(
//      'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4');

//  final chewieController = ChewieController(
//    videoPlayerController: videoPlayerController,
//    aspectRatio: 1,
//    autoPlay: true,
//    looping: true,
//  );

//  final playerWidget = Chewie(
//    controller: chewieController,
//  );

class VideoWidget extends StatefulWidget {

  final String url;
  final String previewImgUrl; //预览图片的地址
  final bool showProgressBar; //是否显示进度条
  final bool showProgressText; //是否显示进度文本
  final int positionTag;

  VideoWidget(this.url,
      {Key key,
      this.previewImgUrl: '',
      this.showProgressBar = true,
      this.showProgressText = true,
      this.positionTag})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VideoWidgetState();
  }
}

class VideoWidgetState extends State<VideoWidget> {

  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Chewie playerWidget;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.network(this.widget.url);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // 拖动条样式颜色
      materialProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return playerWidget;
  }



}
