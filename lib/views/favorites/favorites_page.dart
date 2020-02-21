import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/api/collect_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserListModel.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/views/detail/detail_router.dart';
import 'package:movie/widgets/image/radius_img.dart';
import 'package:movie/widgets/rating_bar.dart';
import 'package:movie/widgets/subject_mark_image_widget.dart';
import 'package:movie/widgets/video_widget.dart';
import 'my_favorites_tab_bar.dart';
import 'favorites_app_bar.dart' as myapp;
import 'dart:math' as math;

///首页，TAB页面，显示动态和推荐TAB
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getWidget();
  }
}

var _tabs = ['收藏', '關注'];

DefaultTabController getWidget() {
  return DefaultTabController(
    initialIndex: 0,
    length: _tabs.length, // This is the number of tabs.
    child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // These are the slivers that show up in the "outer" scroll view.
        return <Widget>[
          SliverOverlapAbsorber(
            // This widget takes the overlapping behavior of the SliverAppBar,
            // and redirects it to the SliverOverlapInjector below. If it is
            // missing, then it is possible for the nested "inner" scroll view
            // below to end up under the SliverAppBar even when the inner
            // scroll view thinks it has not been scrolled.
            // This is not necessary if the "headerSliverBuilder" only builds
            // widgets that do not overlap the next sliver.
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: SliverAppBar(
              pinned: true,
              expandedHeight: 0.0,
              primary: true,
              titleSpacing: 0.0,
              backgroundColor: Color.fromRGBO(45, 45, 48, 1),
              title: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                // These are the widgets to put in each tab in the tab bar.
                tabs: <Widget>[
                  Tab(
                    text: _tabs[0],
                  ),
                  Tab(
                    text: _tabs[1],
                  )
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        // These are the contents of the tab views, below the tabs.
        children: _tabs.map((String name) {
          return SliverContainer(
            name: name,
          );
        }).toList(),
      ),
    ),
  );
}

class SliverContainer extends StatefulWidget {
  final String name;

  SliverContainer({Key key, @required this.name}) : super(key: key);

  @override
  _SliverContainerState createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {

  bool loading = true;
  List<Products> favoritesList;
  List<Users> attentionList;
  ScrollController attentionController;

  @override
  void initState() {
    super.initState();

    ///请求动态数据

    _requestFavoritesAPI();

    _requestAttentionAPI();

    setState(() {
      loading = false;
    });
  }

  _requestFavoritesAPI() async {
    GoodProducts model = await CollectApi.getFavoritesList(page: 1);
    if(model != null){
      setState(() {
        favoritesList = model.products;
      });
    }
  }

  _requestAttentionAPI() async {

    UserListModel userListModel = await CollectApi.getFollowsList(page: 1);
    if(userListModel != null){
      setState(() {
        attentionList = userListModel.users;
      });
    }
  }

  Future<void> _onRefresherFavorites() async {
    setState(() {
      loading = true;
    });
    _requestFavoritesAPI();
    setState(() {
      loading = false;
    });
  }

  Future<void>  _onRefresherAttention() async {
    setState(() {
      loading = true;
    });
    _requestAttentionAPI();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return getContentSliver(context);
  }

  getContentSliver(BuildContext context) {
    if (widget.name == _tabs[0]) {
      if (favoritesList == null || favoritesList.length == 0) {
        return Scaffold(
            backgroundColor: Color.fromRGBO(50, 50, 50, 1),
            body: Padding(
                padding: EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
                child: Text('暂无数据',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)
                )
            ));
      }
      return _favoritesContainer(context, favoritesList);
    }else{

      if (attentionList == null || attentionList.length == 0) {
        return Scaffold(
            backgroundColor: Color.fromRGBO(50, 50, 50, 1),
            body: Padding(
                padding: EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
                child: Text('暂无数据',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)
                )
            ));
      }
      return _attentionContainer(context, attentionList);
//      return SafeArea(
//        top: false,
//        bottom: false,
//        child: Builder(
//          // This Builder is needed to provide a BuildContext that is "inside"
//          // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
//          // find the NestedScrollView.
//          builder: (BuildContext context) {
//            return CustomScrollView(
//              physics: const BouncingScrollPhysics(),
//              // The "controller" and "primary" members should be left
//              // unset, so that the NestedScrollView can control this
//              // inner scroll view.
//              // If the "controller" property is set, then this scroll
//              // view will not be associated with the NestedScrollView.
//              // The PageStorageKey should be unique to this ScrollView;
//              // it allows the list to remember its scroll position when
//              // the tab view is not on the screen.
//              key: PageStorageKey<String>(widget.name),
//              slivers: <Widget>[
//                SliverOverlapInjector(
//                  // This is the flip side of the SliverOverlapAbsorber above.
//                  handle:
//                  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                ),
//                SliverList(
//                    delegate: SliverChildBuilderDelegate(
//                        ((BuildContext context, int index) {
//                          return getCommonItem(attentionList, index);
//                        }), childCount: attentionList.length)),
//              ],
//            );
//          },
//        ),
//      );
    }


  }

  double singleLineImgHeight = 180.0;
  double contentVideoHeight = 350.0;

  ///列表的普通单个item
  getCommonItem(List<Users> items, int index) {
    Users item = items[index];
    bool showVideo = index == 1 || index == 3;
    return Container(
      height: showVideo ? contentVideoHeight : singleLineImgHeight,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(
          left: Constant.MARGIN_LEFT,
          right: Constant.MARGIN_RIGHT,
          top: Constant.MARGIN_RIGHT,
          bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Row(
//            children: <Widget>[
//              CircleAvatar(
//                radius: 25.0,
//                backgroundImage: NetworkImage(item.defaultPhoto.thumb),
//                backgroundColor: Colors.white,
//              ),
//              Padding(
//                padding: const EdgeInsets.only(left: 10.0),
//                child: Text(item.name),
//              ),
//              Expanded(
//                child: Align(
//                  child: Icon(
//                    Icons.more_horiz,
//                    color: Colors.grey,
//                    size: 18.0,
//                  ),
//                  alignment: Alignment.centerRight,
//                ),
//              )
//            ],
//          ),
//          Expanded(
//              child: Container(
//            child: showVideo ? getContentVideo(index) : getItemCenterImg(item),
//          )),
//          Padding(
//            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Image.asset(
//                  Constant.ASSETS_IMG + 'ic_vote.png',
//                  width: 25.0,
//                  height: 25.0,
//                ),
//                Image.asset(
//                  Constant.ASSETS_IMG +
//                      'ic_notification_tv_calendar_comments.png',
//                  width: 20.0,
//                  height: 20.0,
//                ),
//                Image.asset(
//                  Constant.ASSETS_IMG + 'ic_status_detail_reshare_icon.png',
//                  width: 25.0,
//                  height: 25.0,
//                ),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }

  getItemCenterImg(Products item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: RadiusImg.get(item.defaultPhoto.large, null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0)),
              )),
        ),
        Expanded(
          child: RadiusImg.get(item.defaultPhoto.thumb, null, radius: 0.0),
        ),
        Expanded(
          child: RadiusImg.get(item.defaultPhoto.thumb, null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)))),
        )
      ],
    );
  }

  getContentVideo(int index) {
    if(!mounted){
      return Container();
    }
    return VideoWidget(
      index == 1 ? Constant.URL_MP4_DEMO_0 :  Constant.URL_MP4_DEMO_1,
      showProgressBar: false,
    );
  }

  ///动态TAB
  _loginContainer(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Constant.ASSETS_IMG + 'ic_new_empty_view_default.png',
            width: 120.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
            child: Text(
              '登录后查看关注人动态',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Text(
                '去登录',
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ),
              padding: const EdgeInsets.only(
                  left: 35.0, right: 35.0, top: 8.0, bottom: 8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))),
            ),
            onTap: () {
//            Router.push(context, Router.searchPage, '搜索笨啦灯');
            },
          )
        ],
      ),
    );
  }

  var hotChildAspectRatio;
  var comingSoonChildAspectRatio;
  var itemW;
  var imgSize;

  ///收藏TAB
  _favoritesContainer(BuildContext context, List<Products> beans) {
    if (itemW == null || imgSize <= 0) {
      MediaQuery.of(context);
      var w = MediaQuery.of(context).size.width;
      imgSize = w / 5 * 3;
      itemW = (w - 30.0 - 20.0) / 3;
      hotChildAspectRatio = (377.0 / 674.0);
      comingSoonChildAspectRatio = (377.0 / 742.0);
    }

//    if(beans == null){
//      return Scaffold(
//          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
//          body: Padding(
//              padding: EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
//              child: Text('暂无数据',
//                  style: TextStyle(fontSize: 16.0, color: Colors.white)
//              )
//          ));
//    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        body: RefreshIndicator(
            color: Colors.deepOrangeAccent,
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                slivers: <Widget>[
                  getCommonSliverGrid(context, beans),
                ],
              ),
            ),
            onRefresh: _onRefresherFavorites
        )
    );
  }

  ///图片+订阅+名称+星标
  SliverGrid getCommonSliverGrid(BuildContext context, List<Products> beans) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return _getHotMovieItem(context, beans[index], itemW);
        }, childCount: math.min(beans.length, 6)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0.0, //主轴(竖直)方向间距
            crossAxisSpacing: 10.0, //纵轴(水平)方向间距
            childAspectRatio: hotChildAspectRatio));
  }

  ///影院热映item
  Widget _getHotMovieItem(BuildContext context, Products bean, var itemW) {
    if (bean == null) {
      return Container();
    }
    bool markAdd = bean.isCollect == 1 ? true : false;
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            SubjectMarkImageWidget(
              bean.defaultPhoto.thumb,
              width: itemW,
              markAdd: markAdd,
              id: bean.id
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
              math.Random.secure().nextInt(5),
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

  ///关注TAB
  _attentionContainer(BuildContext context, List<Users> beans) {
    if (itemW == null || imgSize <= 0) {
      MediaQuery.of(context);
      var w = MediaQuery.of(context).size.width;
      imgSize = w / 5 * 3;
      itemW = (w - 30.0 - 20.0) / 3;
      hotChildAspectRatio = (377.0 / 674.0);
      comingSoonChildAspectRatio = (377.0 / 742.0);
    }

//    if(beans == null){
//      return Scaffold(
//          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
//          body: Padding(
//              padding: EdgeInsets.only(top: 80.0, left: 15.0, right: 15.0),
//              child: Text('暂无数据',
//                  style: TextStyle(fontSize: 16.0, color: Colors.white)
//              )
//          ));
//    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        body: RefreshIndicator(
            color: Colors.deepOrangeAccent,
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
              child: ListView(
                  controller: attentionController,
                  cacheExtent: Adapt.px(180),
                  children: beans.map(_buildCell).toList()
              ),
            ),
            onRefresh: _onRefresherAttention
        )
    );
  }

  Widget _buildCell(Users d) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('ListDetailPage', arguments: {
          'userid': d.id.toString()
        });
      },
      child: Column(
        // key: ValueKey<int>(d.userinfo['id']),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(Adapt.px(20)),
            child: Row(
              children: <Widget>[
                Container(
                  width: Adapt.px(100),
                  height: Adapt.px(100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Adapt.px(50)),
                      image: d.avatar != null ? DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              d.avatar
                          )
                      ) : null
                  ),
                ),
                SizedBox(
                  width: Adapt.px(20),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: Adapt.px(450),
                      child: Text(
                        d.username ?? '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimens.font_sp16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(d.rank?.name ?? '',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Dimens.font_sp12
                        )
                    ),
                    SizedBox(
                      height: Adapt.px(8),
                    ),
                  ],
                ),
//                Expanded(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Container(
//                        width: Adapt.px(500),
//                        child: Text(
//                          "视频数量",
//                          style: TextStyle(
//                              color: Colors.grey[700],
//                              fontSize: Adapt.px(24),
//                              fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                      Text(d?.workVideos ?? '0',
//                         style: TextStyle(
//                             color: Colors.grey[700], fontSize: Adapt.px(24))),
//                      SizedBox(
//                        height: Adapt.px(8),
//                      ),
//                    ],
//                  ),
//                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}

