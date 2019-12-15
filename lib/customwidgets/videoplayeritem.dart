
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:movie/api/moviedetail_api.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/models/moviedetail.dart';

class VideoPlayerItem extends StatefulWidget {
  final String movieid;
  final VideoPlayerController vc;
  final String coverurl;
  final bool showplayer;
  final int playtime;
  final int duration;
  VideoPlayerItem({this.movieid, @required this.vc, this.coverurl, this.showplayer,this.playtime,this.duration, Key key})
      : super(key: key);
  @override
  VideoPlayerItemState createState() => VideoPlayerItemState();
}

class VideoPlayerItemState extends State<VideoPlayerItem> {
  
  ChewieController chewieController;
  VideoPlayerController vc;
  bool showplayer = true;
  String coverurl;
  String movieid;

  Future dialog() {
    return showDialog(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('提示'),
                content:Text('今日免费观看次数已经结束，是否前往购买时长？'),
                actions:<Widget>[
                  FlatButton(
                    child: Text('取消'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('同意'),
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('WebPage', arguments: {
    'uid': ApiHelper.uid
  });
                    },
                  ),
                ],
                // backgroundColor:Colors.yellowAccent,
                elevation: 20,
                // semanticLabel:'哈哈哈哈',
                // 设置成 圆角
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              );
            },
          );
  }
 

  Future playButtonClicked() async {
    MovieDetailModelReturn r = await MoiveDetailApi.getMovieDetailData(ApiHelper.uid, movieid);
    if (r != null) {
      if (r.code == 1001) {
        dialog();
      } else {
        play();
        await MoiveDetailApi.addView(ApiHelper.uid, ApiHelper.token, movieid);
      }
      
    }
  }

  void play(){
    if (!vc.value.initialized) {
      vc.initialize().then((_) {
        setState(() {
          showplayer = false;
          coverurl = "";
        });
        vc.play();
      });
      setState(() {
        showplayer = false;
        coverurl = "";
      });
    } else if (!vc.value.isPlaying) {
      setState(() {
        showplayer = false;
        coverurl = "";
      });
      vc.play();
    } 
    else {
      setState(() {
        showplayer = true;
        coverurl = widget.coverurl;
      });                 
        vc.pause();                  
    }
  }

  @override
  void initState() {
    setState(() {
      showplayer = widget.showplayer;
      coverurl = widget.coverurl;
      movieid = widget.movieid;
    });
    vc = widget.vc;
    chewieController = new ChewieController(
      videoPlayerController: vc,
      aspectRatio: 16 / 9,
      // 拖动条样式颜色
      materialProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // vc.pause();
    vc.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Adapt.screenW(),
        height: Adapt.screenH(),
       child: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: new FittedBox(
                    fit: BoxFit.cover,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/CacheBG.jpg',
                      image: coverurl,
                    )),
              ),
              Container(color: Colors.black38,),
              Center(
                child: showplayer == true ? IconButton(
                  iconSize: Adapt.px(120),
                  icon: Icon(Icons.play_circle_outline),
                  color: Colors.white,
                  onPressed: playButtonClicked,
                ) : null, 
              ),
              Offstage(
                offstage: showplayer,
                child: Container(
                  child: Chewie(
                    key: Key(chewieController.videoPlayerController.dataSource),
                    controller: chewieController,
                  ),
                ),
              ),
            ],
        ));
  }
}
