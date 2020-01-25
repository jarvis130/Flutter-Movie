import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/widgets/shimmercell.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserModel.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ListDetailPageState state, Dispatch dispatch, ViewService viewService) {

  UserModel userDetailModel = state.userDetailModel;
  GoodProducts videoList = state.videoList;

  String _covertDuration(int d) {
    String result = '';
    Duration duration = Duration(minutes: d);
    int h = duration.inHours;
    int countedMin = h * 60;
    int m = duration.inMinutes - countedMin;
    result += h > 0 ? '$h H ' : '';
    result += '$m M';
    return result;
  }

  Widget _buildIconButton(IconData icon, void onPress()) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onPress,
    );
  }

  Widget _buildInfoCell(String value, String title,
      {Widget valueChild,
      Color labelColor = Colors.black,
      Color titleColor = Colors.black}) {
    var titleStyle = TextStyle(
        fontSize: Adapt.px(26), color: titleColor, fontWeight: FontWeight.bold);
    var valueStyle = TextStyle(
        color: labelColor, fontWeight: FontWeight.bold, fontSize: Adapt.px(28));
    return SizedBox(
      width: Adapt.px(160),
      child: Column(
        children: <Widget>[
          valueChild == null
              ? Text(
                  value ?? '',
                  style: valueStyle,
                )
              : valueChild,
          SizedBox(
            height: Adapt.px(8),
          ),
          Text(
            title,
            style: titleStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoGroup() {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: Adapt.px(20)),
//      color: Colors.white,
//      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          _buildInfoCell(d?.results.length?.toString() ?? '0', '视频数量'),
//          Container(
//            color: Colors.grey[300],
//            width: Adapt.px(1),
//            height: Adapt.px(60),
//          ),
//          _buildInfoCell('', '粉丝',
//              valueChild: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(
//                    d?.fans ?? '0',
//                    style: TextStyle(
//                        color: Colors.black,
//                        fontWeight: FontWeight.bold,
//                        fontSize: Adapt.px(28)),
//                  ),
//                  Icon(
//                    Icons.star,
//                    color: Colors.black,
//                    size: Adapt.px(20),
//                  )
//                ],
//              )),
//          Container(
//            color: Colors.grey[300],
//            width: Adapt.px(1),
//            height: Adapt.px(60),
//          ),
//          _buildInfoCell('0', '金币'),
//          Container(
//            color: Colors.grey[300],
//            width: Adapt.px(1),
//            height: Adapt.px(60),
//          ),
//        ],
//      ),
//    );
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

  Widget _buildShareCardHeader() {

//    double cellwidth = Adapt.px(145);
//    return Column(
//      children: <Widget>[
//        SizedBox(
//          height: Adapt.px(20),
//        ),
//        Text(userDetailModel.user.username,
//            style: TextStyle(
//                color: Colors.white,
//                fontSize: Adapt.px(45),
//                fontWeight: FontWeight.bold)),
//        SizedBox(
//          height: Adapt.px(20),
//        ),
//        Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              SizedBox(
//                width: Adapt.px(150),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Container(
//                      width: Adapt.px(80),
//                      height: Adapt.px(80),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(Adapt.px(40)),
//                          image: DecorationImage(
//                              image: CachedNetworkImageProvider(
//                                  userDetailModel.user.avatar
//                          ))),
//                    ),
//                    SizedBox(
//                      height: Adapt.px(10),
//                    ),
//                    Text(
//                      userDetailModel.user.avatar,
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold,
//                          fontSize: Adapt.px(30)),
//                    ),
//                    SizedBox(
//                      height: Adapt.px(5),
//                    ),
//                  ],
//                ),
//              ),
//              SizedBox(
//                width: Adapt.px(20),
//              ),
//              Column(
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      _buildInfoCell(
//                        d?.totalResults?.toString() ?? '0',
//                        '视频',
//                        labelColor: Colors.white,
//                        titleColor: Colors.white,
//                      ),
//                      SizedBox(
//                        width: Adapt.px(20),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: Adapt.px(20),
//                  ),
//                  Row(
//                    children: <Widget>[
//                      SizedBox(
//                        width: Adapt.px(20),
//                      ),
//                    ],
//                  )
//                ],
//              )
//            ]),
//      ],
//    );
  }

  Widget _buildHeader() {
    if (userDetailModel.user != null)
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            //colorFilter: ColorFilter.mode(Colors.black87, BlendMode.color),
            image: userDetailModel.user.avatar != null ? CachedNetworkImageProvider(
                userDetailModel.user.avatar
            ) : new ExactAssetImage('images/empty.png'),
          )
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(Adapt.px(30)),
          color: Colors.black.withOpacity(0.7),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: Adapt.px(100)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      width: Adapt.px(100),
                      height: Adapt.px(100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Adapt.px(50)),
                          image: DecorationImage(
                              image: userDetailModel.user.avatar != null ? CachedNetworkImageProvider(
                                  userDetailModel.user.avatar
                              ) : new ExactAssetImage('images/empty.png')
                          )
                        ),
                    ),
                    SizedBox(
                      width: Adapt.px(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          child: Text(
                            userDetailModel.user?.username ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimens.font_sp16
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Adapt.px(5),
                        ),
                         SizedBox(
                           width: Adapt.px(200),
                           child: Text(
                             userDetailModel.user?.rank?.name ?? '',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: Dimens.font_sp12
                             ),
                           ),
                         )
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
//                    IconButton(
//                      icon: Icon(userDetailModel.user.isAttention == 0 ? Icons.favorite_border : Icons.favorite, color: userDetailModel.user.isAttention == 0 ? Color.fromRGBO(50, 50, 50, 1) : Colors.pink[400]),
//                      onPressed: (){
//                        dispatch(ListDetailPageActionCreator.setAttention(userDetailModel.user.id));
//                      },
//                    ),
//                    _buildIconButton(Icons.exposure_plus_1, () {}),
//                     _buildIconButton(Icons.share, () {
//                       showDialog(
//                           context: viewService.context,
//                           builder: (ctx) {
//                             return ShareCard(
//                               backgroundImage: ImageUrl.getUrl(
//                                   state.listDetailModel.avatar_thumb,
//                                   ImageSize.w500),
//                               qrValue:
//                                   "https://www.themoviedb.org/list/${state.listDetailModel.id}",
//                               header: _buildShareCardHeader(),
//                             );
//                           });
//                     }),
                    // PopupMenuButton<SortCondition>(
                    //   offset: Offset(0, Adapt.px(100)),
                    //   icon: Icon(Icons.sort, color: Colors.white),
                    //   onSelected: (selected) => dispatch(
                    //       ListDetailPageActionCreator.sortChanged(selected)),
                    //   itemBuilder: (ctx) {
                    //     return state.sortBy.map((s) {
                    //       var unSelectedStyle = TextStyle(color: Colors.grey);
                    //       var selectedStyle = TextStyle(
                    //           color: Colors.black, fontWeight: FontWeight.bold);
                    //       return PopupMenuItem<SortCondition>(
                    //         value: s,
                    //         child: Row(
                    //           children: <Widget>[
                    //             Text(
                    //               s.name,
                    //               style: s.isSelected
                    //                   ? selectedStyle
                    //                   : unSelectedStyle,
                    //             ),
                    //             Expanded(
                    //               child: Container(),
                    //             ),
                    //             s.isSelected ? Icon(Icons.check) : SizedBox()
                    //           ],
                    //         ),
                    //       );
                    //     }).toList();
                    //   },
                    // )
                  ]),
                  SizedBox(
                    height: Adapt.px(20),
                  ),
//                   Text('关于作者',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: Adapt.px(30))),
//                   Container(
//                     width: Adapt.screenW() - Adapt.px(60),
//                     height: Adapt.px(120),
//                     child: Text(
//                       userDetailModel.user.rank.name ?? '',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 4,
//                       style: TextStyle(
//                           color: Colors.white, fontSize: Adapt.px(26)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: Adapt.px(30),
//                   ),
                ],
              ),
            ),
          ),
        ),
      );
    else
      return _buildShimmerHeader();
  }

  Widget _buildListCell(Products videos) {
    return GestureDetector(
      onTap: () {
         dispatch(ListDetailPageActionCreator.cellTapped(videos));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    videos.defaultPhoto.thumb
                ))),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(Adapt.px(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: Adapt.px(30),
                    ),
                    // Text(
                    //   d.vote_average.toStringAsFixed(1),
                    //   style: TextStyle(color: Colors.white),
                    // )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {

    var width = Adapt.screenW() / 3;
    var height = Adapt.px(300);
    if (videoList.products != null)
      return SliverGrid.extent(
        childAspectRatio: 2 / 3,
        maxCrossAxisExtent: width,
        crossAxisSpacing: Adapt.px(10),
        mainAxisSpacing: Adapt.px(10),
        children: videoList.products.map(_buildListCell).toList(),
      );
    else
      return SliverGrid.extent(
        childAspectRatio: 2 / 3,
        maxCrossAxisExtent: width,
        crossAxisSpacing: Adapt.px(10),
        mainAxisSpacing: Adapt.px(10),
        children: <Widget>[
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
          ShimmerCell(width, height, 0),
        ],
      );
  }

  return Scaffold(
    body: CustomScrollView(
      controller: state.scrollController,
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
          pinned: true,
          title: Text(
            state?.userDetailModel?.user?.username ?? '',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimens.font_sp18
            ),
          ),
          expandedHeight: Adapt.px(280),
          flexibleSpace: FlexibleSpaceBar(
            background: _buildHeader(),
          ),
//          bottom: PreferredSize(
//            preferredSize: Size.fromHeight(Adapt.px(100)),
//            child: _buildInfoGroup(),
//          ),
        ),
        _buildBody(),
        SliverToBoxAdapter(
          child: videoList.products == null ? Container() : Offstage(
            offstage:
              state.videoList.products.length == state.total,
            child: Container(
              height: Adapt.px(80),
              margin: EdgeInsets.only(top: Adapt.px(30)),
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: Adapt.px(30),
          ),
        )
      ],
    ),
  );
}
