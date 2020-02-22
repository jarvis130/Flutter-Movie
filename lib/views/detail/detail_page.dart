import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/api/comment_api.dart';
import 'package:movie/api/moviedetail_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/views/detail/detail_title_widget.dart';
import 'dart:math' as math;
import 'package:movie/widgets/animal_photo.dart';
import 'package:flutter/rendering.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/widgets/videoplayeritem.dart';
import 'package:video_player/video_player.dart';
import '../../widgets/bottom_drag_widget.dart';
import 'long_comment_widget.dart';

///影片、电视详情页面
class DetailPage extends StatefulWidget {
  final params;

  DetailPage(this.params, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState(params['subjectId'][0]);
  }
}

class _DetailPageState extends State<DetailPage> {
  bool loading = true;
  final subjectId;
  Color pickColor = Color(0xffffffff); //默认主题色

  CommentModel commentsEntity = new CommentModel();
  CommentModel movieLongCommentReviews = new CommentModel();

  Product _product;

  double get screenH => MediaQuery.of(context).size.height;

  _DetailPageState(this.subjectId);

  // 请求数据
  void requestAPI() async {
    ProductModel model = await MovieDetailApi.getMovieDetail(this.subjectId);

    setState(() {
      _product = model.product;
    });
    CommentModel reviewModel = await CommentApi.getList(
        product: int.parse(this.subjectId),
        page: 1,
        per_page: GlobalConfig.PageSize
    );

    setState(() {
      movieLongCommentReviews = reviewModel;
      commentsEntity = reviewModel;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    if (_product == null) {
      return Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 48, 1),
      body: Container(
        child: SafeArea(
            child: BottomDragWidget(
                body: _getBody(),
                dragContainer: DragContainer(
                    drawer: Container(
                      child: OverscrollNotificationWidget(
                        child: LongCommentWidget(
                            movieLongCommentsEntity: movieLongCommentReviews),
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 244, 248),
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0))),
                    ),
                    defaultShowHeight: screenH * 0.1,
                    height: screenH * 0.8
                )
            )
        ),
      ),
    );
  }


  ///所属频道
//  SliverToBoxAdapter sliverTags() {
//    return SliverToBoxAdapter(
//      child: Container(
//        height: 30.0,
//        padding: padding(),
//        child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemCount: _movieDetailBean.tags.length + 1,
//            itemBuilder: (BuildContext context, int index) {
//              if (index == 0) {
//                return Container(
//                  alignment: Alignment.center,
//                  child: Padding(
//                    padding: EdgeInsets.only(right: 10.0),
//                    child: Text(
//                      '所属频道',
//                      style: TextStyle(color: Colors.white70, fontSize: 13.0),
//                    ),
//                  ),
//                );
//              } else {
//                return Container(
//                  alignment: Alignment.center,
//                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                  margin: EdgeInsets.only(right: 10.0),
//                  decoration: BoxDecoration(
//                      color: Color(0x23000000),
//                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
//                  child: Text(
//                    '${_movieDetailBean.tags[index - 1]}',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                );
//              }
//            }),
//      ),
//    );
//  }

  ///剧情简介
  SliverToBoxAdapter sliverSummary() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
              child: Text(
                '劇情簡介',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              _product.goodsBrief,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0x44000000),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      ),
    );
  }

  ///演职员
  SliverToBoxAdapter sliverCasts() {
    return SliverToBoxAdapter(
      child: getPadding(Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text('演职员',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
//                Text(
//                  '全部 ${_movieDetailBean.casts.length} >',
//                  style: TextStyle(fontSize: 12.0, color: Colors.white70),
//                )
              ],
            ),
          ),
          Container(
            height: 85.0,
            child: ListView.builder(
              itemBuilder: ((BuildContext context, int index) {
//                if (index == 0 && _product.isNotEmpty) {
//                  //第一个显示导演
//                  Director director = _movieDetailBean.directors[0];
//                  if (director.avatars == null) {
//                    return Container();
//                  }
//                  return getCast(
//                      director.id, director.avatars.large, director.name);
//                } else {
                  Actor cast = _product.actors[index];
                  if (cast.actorAvatar == null) {
                    return Container();
                  }
                  return getCast(cast.actorId.toString(), cast.actorAvatar, cast.actorName);
//                }
              }),
              itemCount: math.min(9, _product.actors.length),
              //最多显示9个演员
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      )),
    );
  }

  ///演职表图片
  Widget getCast(String id, String imgUrl, String name) {
    return Hero(
        tag: imgUrl,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0, right: 14.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    child: imgUrl != "" ? Image.network(
                      imgUrl,
                      height: 120.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ) : Container(
                      width: Adapt.px(80),
                      height: Adapt.px(120),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: Adapt.px(5)),
//                          borderRadius: BorderRadius.circular(Adapt.px(60)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/logo.png'),
                          )
                      ),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 13.0, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
//              Router.push(context, Router.personDetailPage,
//                  {'personImgUrl': imgUrl, 'id': id});
            },
          ),
        ));
  }

  ///预告片、剧照 727x488
  trailers(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 5 * 3;
    var h = w / 727 * 488;
//    _movieDetailBean.trailers.addAll(_movieDetailBean.bloopers);
    return SliverToBoxAdapter(
      child: getPadding(Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  '劇照',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                Text(
                  '全部 ${_product.photos.length}',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(255, 192, 193, 203)),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            height: h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
//                if (index == 0 && _product.photos.isNotEmpty) {
//                  return GestureDetector(
//                    child: Padding(
//                      padding: EdgeInsets.only(right: 2.0),
//                      child: Stack(
//                        children: <Widget>[
//                          Container(
//                            child: _getTrailers(w, h),
//                          ),
//                          Container(
//                            width: w,
//                            height: h,
//                            child: Icon(
//                              Icons.play_circle_outline,
//                              size: 40.0,
//                              color: Colors.white,
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.all(4.0),
//                            padding: EdgeInsets.only(
//                                left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
//                            child: Text(
//                              '预告片',
//                              style: TextStyle(
//                                  fontSize: 11.0, color: Colors.white),
//                            ),
//                            decoration: BoxDecoration(
//                              color: Color.fromARGB(255, 232, 145, 66),
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(3.0)),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                    onTap: () {
////                      Router.push(context, Router.playListPage,
////                          _movieDetailBean.trailers);
//                    },
//                  );
//                } else {
                  Photos bean = _product.photos[index];
                    return showBigImg(
                        Padding(
                          padding: EdgeInsets.only(right: 2.0),
                          child: Image.network(
                            bean.goodsThumb,
                            fit: BoxFit.cover,
                            width: w,
                            height: h,
                          ),
                        ),
                        bean.goodsThumb
                    );

//               }
              },
              itemCount: _product.photos.length,
            ),
          )
        ],
      )),
    );
  }

  ///短评，默认显示4个
//  sliverComments() {
//    if (commentsEntity == null || commentsEntity.comments.isEmpty) {
//      return SliverToBoxAdapter();
//    } else {
//      var backgroundColor = Color(0x44000000);
//      int allCount = math.min(4, commentsEntity.comments.length);
//      allCount = allCount + 2; //多出来的2个表示头和脚
//      return SliverList(
//          delegate:
//              SliverChildBuilderDelegate((BuildContext context, int index) {
//        if (index == 0) {
//          ///头布局
//          return Container(
//            margin: EdgeInsets.only(
//                top: 30.0,
//                left: Constant.MARGIN_LEFT,
//                right: Constant.MARGIN_RIGHT),
//            decoration: BoxDecoration(
//                color: backgroundColor,
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(8.0),
//                    topRight: Radius.circular(8.0))),
//            padding: EdgeInsets.all(12.0),
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: Text(
//                    '短评',
//                    style: TextStyle(color: Colors.white, fontSize: 16.0),
//                  ),
//                ),
//                Text(
//                  '全部短评 ${commentsEntity.total} >',
//                  style: TextStyle(color: Color(0x88fffffff), fontSize: 12.0),
//                )
//              ],
//            ),
//          );
//        } else if (index == allCount - 1) {
//          ///显示脚布局
//          return Container(
//            padding: EdgeInsets.all(10.0),
//            margin: EdgeInsets.only(
//                bottom: 20.0,
//                left: Constant.MARGIN_LEFT,
//                right: Constant.MARGIN_RIGHT),
//            decoration: BoxDecoration(
//                color: backgroundColor,
//                borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(8.0),
//                    bottomRight: Radius.circular(8.0))),
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: Text(
//                    '查看全部评价',
//                    style: TextStyle(color: Colors.white, fontSize: 16.0),
//                  ),
//                ),
//                Icon(Icons.keyboard_arrow_right,
//                    size: 20.0, color: Color(0x88fffffff))
//              ],
//            ),
//          );
//        } else {
//          CommentModel bean = commentsEntity.comments[index - 1];
//          return GestureDetector(
//            behavior: HitTestBehavior.translucent,
//            child: Container(
//              margin: padding(),
//
//              ///内容item
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(
//                            right: 10.0, top: 10.0, bottom: 5.0),
//                        child: CircleAvatar(
//                          radius: 18.0,
//                          backgroundImage: NetworkImage(bean.author.avatar),
//                          backgroundColor: Colors.white,
//                        ),
//                      ),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            bean.author.name,
//                            style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 14.0,
//                                color: Colors.white),
//                          ),
//                          RatingBar(
//                            ((bean.rating.value * 1.0) /
//                                    (bean.rating.max * 1.0)) *
//                                10.0,
//                            size: 11.0,
//                            fontSize: 0.0,
//                          )
//                        ],
//                      )
//                    ],
//                  ),
//                  Text(
//                    bean.content,
//                    softWrap: true,
//                    maxLines: 6,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(fontSize: 15.0, color: Colors.white),
//                  ),
//                  Row(
//                    //赞的数量
//                    children: <Widget>[
//                      Image.asset(
//                        Constant.ASSETS_IMG + 'ic_vote_normal_large.png',
//                        width: 20.0,
//                        height: 20.0,
//                      ),
//                      Text(
//                        '${getUsefulCount(bean.usefulCount)}',
//                        style: TextStyle(color: Color(0x88fffffff)),
//                      )
//                    ],
//                  )
//                ],
//              ),
//              decoration: BoxDecoration(
//                color: Color(0x44000000),
//              ),
//              padding: EdgeInsets.all(12.0),
//            ),
//            onTap: () {
////              Router.push(context, bean.author.alt, {'title': '个人主页'});
//            },
//          );
//        }
//      }, childCount: allCount));
//    }
//  }

  ///将34123转成3.4k
  getUsefulCount(int usefulCount) {
    double a = usefulCount / 1000;
    if (a < 1.0) {
      return usefulCount;
    } else {
      return '${a.toStringAsFixed(1)}k'; //保留一位小数
    }
  }

  _getTrailers(double w, double h) {
    if (_product.photos.isEmpty || _product.photos[0].goodsThumb == null) {
      return Container();
    }
    return CachedNetworkImage(
        width: w,
        height: h,
        fit: BoxFit.cover,
        imageUrl: _product.photos[0].goodsThumb);
  }

  //传入的图片组件，点击后，会显示大图页面
  Widget showBigImg(Widget widget, String imgUrl) {
    return Hero(
      tag: imgUrl,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: widget,
          onTap: () {
            AnimalPhoto.show(context, imgUrl);
          },
        ),
      ),
    );
  }

  Widget _getBody() {

    var w = MediaQuery.of(context).size.width / 5 * 3;
    var h = w / 727 * 488;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          title: Text(_product.name),
          centerTitle: true,
          pinned: true,
          backgroundColor: Color.fromRGBO(45, 45, 48, 1),
            expandedHeight: 200.0,  //展开高度200
            floating: false,  //不随着滑动隐藏标题
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background:  _product != null ? VideoPlayerItem(
                movieid: _product.id.toString(),
                vc: VideoPlayerController.network(_product.videoUrl),
                coverurl: _product.defaultPhoto.thumb,
                showplayer: true,
              ) : Container()
            ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
                top: Constant.MARGIN_TOP,
                left: Constant.MARGIN_LEFT,
                right: Constant.MARGIN_RIGHT
            ),
            child: DetailTitleWidget(_product, pickColor),
          )
        ),
//        SliverToBoxAdapter(
//          child: Container(
//            padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
//            margin: padding(),
//            child: ScoreStartWidget(
//              score: _movieDetailBean.rating.average,
//              p1: _movieDetailBean.rating.details.d1 / allCount,
//              p2: _movieDetailBean.rating.details.d2 / allCount,
//              p3: _movieDetailBean.rating.details.d3 / allCount,
//              p4: _movieDetailBean.rating.details.d4 / allCount,
//              p5: _movieDetailBean.rating.details.d5 / allCount,
//            ),
//          ),
//        ),
//        sliverTags(),
        sliverSummary(),
        sliverCasts(),
        trailers(context),
//        sliverComments(),
        SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Constant.MARGIN_TOP,
                  left: Constant.MARGIN_LEFT,
                  right: Constant.MARGIN_RIGHT,
                bottom: 80,
              ),
              child: Container(),
            )
        ),
      ],
    );
  }

  padding() {
    return EdgeInsets.only(
        left: Constant.MARGIN_LEFT, right: Constant.MARGIN_RIGHT);
  }

  getPadding(Widget body) {
    return Padding(
      padding: EdgeInsets.only(
          left: Constant.MARGIN_LEFT, right: Constant.MARGIN_RIGHT),
      child: body,
    );
  }


}
