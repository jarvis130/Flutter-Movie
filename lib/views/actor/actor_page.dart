import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/api/actor_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/models/ActorModel.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:movie/models/ProductModel.dart' as prefix0;
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/utils/Adapt.dart';
import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:movie/views/actor/actor_title_widget.dart';
import 'package:movie/views/detail/detail_router.dart';
import 'package:movie/views/detail/look_confirm_button.dart';
import 'package:movie/widgets/rating_bar.dart';
import 'package:movie/widgets/shimmercell.dart';
import 'package:movie/widgets/subject_mark_image_widget.dart';
import 'package:shimmer/shimmer.dart';

///演员页面
class ActorPage extends StatefulWidget {
  final params;

  ActorPage(this.params, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ActorPageState(params['actorId'][0]);
  }
}

class _ActorPageState extends State<ActorPage> {
  bool loading = true;
  final actorId;
  Color pickColor = Color(0xffffffff); //默认主题色

  CommentModel commentsEntity = new CommentModel();
  CommentModel movieLongCommentReviews = new CommentModel();

  Actor _actor;
  var itemW;
  var imgSize;
  var hotChildAspectRatio;
  var comingSoonChildAspectRatio;

  double get screenH => MediaQuery.of(context).size.height;

  _ActorPageState(this.actorId);

  // 请求数据
  Future<void> requestAPI() async {
    ActorModel model = await ActorApi.getActorInfo(this.actorId);
    if(model != null){
      setState(() {
        _actor = model.actor[0];
      });
    }

    setState(() {
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

    if (itemW == null || imgSize <= 0) {
      MediaQuery.of(context);
      var w = MediaQuery.of(context).size.width;
      imgSize = w / 5 * 3;
      itemW = (w - 30.0 - 20.0) / 3;
      hotChildAspectRatio = (377.0 / 674.0);
      comingSoonChildAspectRatio = (377.0 / 742.0);
    }
//    return Stack(
//      children: <Widget>[
//        containerBody(),
//        Offstage(
//          child: LoadingWidget.getLoading(backgroundColor: Colors.transparent),
//          offstage: !loading,
//        )
//      ],
//    );
    if(_actor == null){
      return Container();
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 48, 1),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                backgroundColor: Color.fromRGBO(50, 50, 50, 1),
                pinned: true,
                title: Text(
                  '演员主頁',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.font_sp18
                  ),
                ),
                actions: <Widget>[],
                expandedHeight: Adapt.px(350),
                flexibleSpace: FlexibleSpaceBar(
                  background: _buildHeader(),
                ),
              ),
            ];
          },
          body: RefreshIndicator(
              color: Colors.deepOrangeAccent,
              backgroundColor: Colors.white,
              child: Stack(
                children: <Widget>[
                  containerBody(),
//                  Offstage(
//                    child: LoadingWidget.getLoading(backgroundColor: Colors.transparent),
//                    offstage: !loading,
//                  )
                ],
              ),
              onRefresh: requestAPI
          )
      ),
    );
  }

    Widget _buildHeader() {
    if (_actor != null)
      return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: Adapt.px(10), top: Adapt.px(50)), //EdgeInsets.all(Adapt.px(10)),
        color: Colors.black.withOpacity(0.7),
        child: SafeArea(
          child: Container(
              padding: EdgeInsets.only(top: Adapt.px(10)),
              child: ActorTitleWidget(
                  _actor, pickColor
              )
          ),
        ),
      );
    else
      return _buildShimmerHeader();
  }

//  Widget _buildHeader() {
//    if (_actor != null)
//      return Container(
//        decoration: BoxDecoration(
//            image: DecorationImage(
//              fit: BoxFit.cover,
//              //colorFilter: ColorFilter.mode(Colors.black87, BlendMode.color),
//              image: _actor.actorAvatar != "" ? CachedNetworkImageProvider(
//                  _actor.actorAvatar
//              ) : new ExactAssetImage('assets/images/empty.png'),
//            )
//        ),
//        child: Container(
//          alignment: Alignment.bottomLeft,
//          padding: EdgeInsets.all(Adapt.px(30)),
//          color: Colors.black.withOpacity(0.7),
//          child: SafeArea(
//            child: Container(
//              padding: EdgeInsets.only(top: Adapt.px(100)),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Row(children: <Widget>[
//                    Container(
//                      width: Adapt.px(100),
//                      height: Adapt.px(100),
//                      decoration: BoxDecoration(
////                          borderRadius: BorderRadius.circular(Adapt.px(50)),
//                          image: DecorationImage(
//                              image: _actor.actorAvatar != "" ? CachedNetworkImageProvider(
//                                  _actor.actorAvatar
//                              ) : new ExactAssetImage('assets/images/empty.png')
//                          )
//                      ),
//                    ),
//                    SizedBox(
//                      width: Adapt.px(20),
//                    ),
//                    Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          width: 120.0,
//                          child: Text(
//                            _actor.actorName,
//                            overflow: TextOverflow.ellipsis,
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: Dimens.font_sp16
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: Adapt.px(5),
//                        ),
//                        SizedBox(
//                          width: Adapt.px(200),
//                          child: Text(
//                            _actor.country,
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: Dimens.font_sp12
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                    Expanded(
//                      child: Container(),
//                    )
//                  ]),
//                  SizedBox(
//                    height: Adapt.px(20),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      );
//    else
//      return _buildShimmerHeader();
//  }

  Widget containerBody() {
    if(_actor == null){
      return Container();
    }
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[

          getCommonSliverGrid(_actor.videos),

        ],
      ),
    );
  }

  ///图片+订阅+名称+星标
  SliverGrid getCommonSliverGrid(List<prefix0.Product> beans) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return _getHotMovieItem(beans[index], itemW);
        }, childCount: math.min(beans.length, 6)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: hotChildAspectRatio));
  }

  ///R角图片
//  getCommonImg(String url, OnTab onTab) {
//    return SliverToBoxAdapter(
//      child: Padding(
//        padding: EdgeInsets.only(top: 15.0),
//        child: CacheImgRadius(
//          imgUrl: url,
//          radius: 5.0,
//          onTab: () {
//            if (onTab != null) {
//              onTab();
//            }
//          },
//        ),
//      ),
//    );
//  }

  Widget _buildBody() {
    if (itemW == null || imgSize <= 0) {
      MediaQuery.of(context);
      var w = MediaQuery.of(context).size.width;
      imgSize = w / 5 * 3;
      itemW = (w - 30.0 - 20.0) / 3;
      hotChildAspectRatio = (377.0 / 674.0);
      comingSoonChildAspectRatio = (377.0 / 742.0);
    }
    if (_actor != null)
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return _getHotMovieItem(_actor.videos[index], itemW);
        }, childCount: math.min(_actor.videos.length, 6)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: hotChildAspectRatio));
    else
      return SliverGrid.extent(
        childAspectRatio: 2 / 3,
        maxCrossAxisExtent: itemW,
        crossAxisSpacing: Adapt.px(10),
        mainAxisSpacing: Adapt.px(10),
        children: <Widget>[
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
          ShimmerCell(itemW, imgSize, 0),
        ],
      );
  }

  ///影院热映item
  Widget _getHotMovieItem(prefix0.Product bean, var itemW) {
    if (bean == null) {
      return Container();
    }

    bool markAdd = bean.isLiked == 1 ? true : false;
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            SubjectMarkImageWidget(
              bean.defaultPhoto.thumb,
              width: itemW,
              id: bean.id,
              markAdd: markAdd,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  bean.name,

                  ///文本只显示一行
                  softWrap: false,

                  ///多出的文本渐隐方式
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            RatingBar(
              bean.goodsGrade == null ? 0 : bean.goodsGrade,
              size: 12.0,
            )
          ],
        ),
      ),
      onTap: () {
        NavigatorUtils.push(context, '${DetailRouter.detailPage}?subjectId=${bean.id.toString()}&id=${bean.id.toString()}');
      },
    );
  }

  Widget _buildShimmerHeader() {
    Color baseColor = Colors.grey;
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(Adapt.px(30)),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: Colors.grey[400],
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: Adapt.px(100)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: Adapt.px(100),
                      height: Adapt.px(100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Adapt.px(50)),
                          color: baseColor),
                    ),
                    SizedBox(
                      width: Adapt.px(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: Adapt.px(120),
                          height: Adapt.px(28),
                          color: baseColor,
                        ),
                        SizedBox(
                          height: Adapt.px(5),
                        ),
                        Container(
                          width: Adapt.px(120),
                          height: Adapt.px(28),
                          color: baseColor,
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    _buildIconButton(Icons.favorite, () {}),
//                    _buildIconButton(Icons.share, () {}),
//                    _buildIconButton(Icons.sort, () {}),
                  ],
                ),
                SizedBox(
                  height: Adapt.px(20),
                ),
//                Text('About this list',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                        fontSize: Adapt.px(30))),
//                SizedBox(
//                  height: Adapt.px(10),
//                ),
//                Container(
//                  width: Adapt.screenW() - Adapt.px(60),
//                  height: Adapt.px(26),
//                  color: baseColor,
//                ),
//                SizedBox(
//                  height: Adapt.px(10),
//                ),
//                Container(
//                  width: Adapt.screenW() - Adapt.px(60),
//                  height: Adapt.px(26),
//                  color: baseColor,
//                ),
//                SizedBox(
//                  height: Adapt.px(10),
//                ),
//                Container(
//                  width: Adapt.screenW() - Adapt.px(200),
//                  height: Adapt.px(26),
//                  color: baseColor,
//                ),
//                SizedBox(
//                  height: Adapt.px(30),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, void onPress()) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onPress,
    );
  }

}
