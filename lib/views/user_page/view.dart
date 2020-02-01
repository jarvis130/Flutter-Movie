import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/utils/imageurl.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/views/order/order_router.dart';
import 'package:movie/views/setting/order_confirm_dialog.dart';
import 'package:movie/views/setting/setting_router.dart';
import 'package:movie/widgets/share_card.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/enums/imagesize.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/views/setting/avatar_page.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserPageState state, Dispatch dispatch, ViewService viewService) {

  UserModel userModel = state.userModel;

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
    var d = userModel.user;
    return Container(
      padding: EdgeInsets.symmetric(vertical: Adapt.px(20)),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
//          _buildInfoCell(d?.results.length?.toString() ?? '0', '视频'),
          Container(
            color: Colors.grey[300],
            width: Adapt.px(1),
            height: Adapt.px(60),
          ),
          _buildInfoCell('', '粉丝',
              valueChild: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
//                    d?.fans ?? '0',
                    '0',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Adapt.px(28)),
                  )
                ],
              )),
          Container(
            color: Colors.grey[300],
            width: Adapt.px(1),
            height: Adapt.px(60),
          ),
          _buildInfoCell('0', '金币'),
          Container(
            color: Colors.grey[300],
            width: Adapt.px(1),
            height: Adapt.px(60),
          ),
//           _buildInfoCell(
//               '\$${((d?.revenue ?? 0) / 1000000000).toStringAsFixed(1)} B',
//               'REVENUE'),
        ],
      ),
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
                        Text(
                          'A list by',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Adapt.px(30)),
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
                    _buildIconButton(Icons.edit, () {}),
                    _buildIconButton(Icons.share, () {}),
                    _buildIconButton(Icons.sort, () {}),
                  ],
                ),
                SizedBox(
                  height: Adapt.px(20),
                ),
                Text('About this list',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Adapt.px(30))),
                SizedBox(
                  height: Adapt.px(10),
                ),
                Container(
                  width: Adapt.screenW() - Adapt.px(60),
                  height: Adapt.px(26),
                  color: baseColor,
                ),
                SizedBox(
                  height: Adapt.px(10),
                ),
                Container(
                  width: Adapt.screenW() - Adapt.px(60),
                  height: Adapt.px(26),
                  color: baseColor,
                ),
                SizedBox(
                  height: Adapt.px(10),
                ),
                Container(
                  width: Adapt.screenW() - Adapt.px(200),
                  height: Adapt.px(26),
                  color: baseColor,
                ),
                SizedBox(
                  height: Adapt.px(30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShareCardHeader() {
    var d = userModel.user;
    double cellwidth = Adapt.px(145);
    return Column(
      children: <Widget>[
        SizedBox(
          height: Adapt.px(20),
        ),
        Text(d.username,
            style: TextStyle(
                color: Colors.white,
                fontSize: Adapt.px(45),
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: Adapt.px(20),
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: Adapt.px(150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: Adapt.px(80),
                      height: Adapt.px(80),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Adapt.px(40)),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  d.avatar
                              ))),
                    ),
                    SizedBox(
                      height: Adapt.px(10),
                    ),
                    Text(
                      d.avatar,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Adapt.px(30)),
                    ),
                    SizedBox(
                      height: Adapt.px(5),
                    ),
                    // SizedBox(
                    //   width: Adapt.px(130),
                    //   child: Text(
                    //     d?.createdBy?.username ?? '',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                width: Adapt.px(20),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildInfoCell(
                        '0',
                        '视频',
                        labelColor: Colors.white,
                        titleColor: Colors.white,
                      ),
                      SizedBox(
                        width: Adapt.px(20),
                      ),
                      // _buildInfoCell(
                      //   d?.averageRating?.toStringAsFixed(1) ?? '0.0',
                      //   'RATING',
                      //   labelColor: Colors.white,
                      //   titleColor: Colors.white,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: Adapt.px(20),
                  ),
                  Row(
                    children: <Widget>[
                      // _buildInfoCell(
                      //   _covertDuration(d?.runtime ?? 0),
                      //   'RUNTIME',
                      //   labelColor: Colors.white,
                      //   titleColor: Colors.white,
                      // ),
                      SizedBox(
                        width: Adapt.px(20),
                      ),
                      // _buildInfoCell(
                      //   '\$${((d?.revenue ?? 0) / 1000000000).toStringAsFixed(1)} B',
                      //   'REVENUE',
                      //   labelColor: Colors.white,
                      //   titleColor: Colors.white,
                      // ),
                    ],
                  )
                ],
              )
            ]),
      ],
    );
  }

  Widget _buildHeader() {
    var d = userModel.user;
    if (d.id != null)
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              //colorFilter: ColorFilter.mode(Colors.black87, BlendMode.color),
              image: CachedNetworkImageProvider(
                  d.avatar
              ),
            )),
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
                              image: CachedNetworkImageProvider(
                                  d.avatar
                              ))),
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
                            d?.username ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adapt.px(35)),
                          ),
                        ),
                        SizedBox(
                          height: Adapt.px(5),
                        ),
                        SizedBox(
                          width: Adapt.px(200),
                          child: Text(
                            d.joinedAt.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Adapt.px(20)),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    _buildIconButton(Icons.edit, () {}),
                    _buildIconButton(Icons.share, () {
                       showDialog(
                           context: viewService.context,
                           builder: (ctx) {
                             return ShareCard(
                               backgroundImage: ImageUrl.getUrl(
                                   d.avatar,
                                   ImageSize.w500),
                               qrValue:
                                   "https://www.themoviedb.org/list/${d.id}",
                               header: _buildShareCardHeader(),
                             );
                           });
                     }),
                    _buildIconButton(Icons.shopping_cart, () {
                      dispatch(UserPageActionCreator.onShipping());
                    }),
                  ]),
                  SizedBox(
                    height: Adapt.px(20),
                  ),
                  Container(
                    width: Adapt.screenW() - Adapt.px(60),
                    height: Adapt.px(120),
                    child: Text(
//                      d. ?? '',
                      '' ,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                          color: Colors.white, fontSize: Adapt.px(26)),
                    ),
                  ),
                  SizedBox(
                    height: Adapt.px(30),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    else
      return _buildShimmerHeader();
  }

  Widget _buildListCell(ListDetailResult d) {
    return GestureDetector(
      onTap: () {
        dispatch(UserPageActionCreator.cellTapped(d));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    d.thumb_s
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
//    var d = userModel.user;
//    var width = Adapt.screenW() / 3;
//    var height = Adapt.px(300);
//    if (d.results.length > 0)
//      return SliverGrid.extent(
//        childAspectRatio: 2 / 3,
//        maxCrossAxisExtent: width,
//        crossAxisSpacing: Adapt.px(10),
//        mainAxisSpacing: Adapt.px(10),
//        children: state.listDetailModel.results.map(_buildListCell).toList(),
//      );
//    else
//      return SliverGrid.extent(
//        childAspectRatio: 2 / 3,
//        maxCrossAxisExtent: width,
//        crossAxisSpacing: Adapt.px(10),
//        mainAxisSpacing: Adapt.px(10),
//        children: <Widget>[
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//          ShimmerCell(width, height, 0),
//        ],
//      );
  }

  Widget _buildCellCard() {
    return Container(
        color: Colors.white,
        width: Adapt.screenW(),
        height: 300,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.pink
              ),
              title: Text(
                '開通賬戶',
                style: TextStyle(
//                      fontWeight: FontWeight.bold,
                    fontSize: Dimens.font_sp16
                ),
              ),
              trailing: Text(
                '30圓/月',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: Dimens.font_sp12
                ),
              ),
              onTap: (){
                showDialog(
                    context: viewService.context,
                    barrierDismissible: false,
                    builder: (_) => OrderConfirmDialog()
                );
              }
            ),
            ListTile(
              leading: Icon(
                  Icons.build,
                  color: Colors.pink
              ),
              title: Text(
                '賬號綁定',
                style: TextStyle(
//                      fontWeight: FontWeight.bold,
                    fontSize: Dimens.font_sp16
                ),
              ),
              trailing: Text(
                '綁定手機每日觀看次數+5',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: Dimens.font_sp12
                ),
              ),
              onTap: (){
                NavigatorUtils.push(viewService.context, SettingRouter.bindingPhonePage);
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.share,
                  color: Colors.pink
              ),
              title: Text(
                '推廣分享',
                style: TextStyle(
//                      fontWeight: FontWeight.bold,
                    fontSize: Dimens.font_sp16
                ),
              ),
              trailing: Text(
                '推薦好友註冊免費看視頻',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: Dimens.font_sp12
                ),
              ),
            ),
//            ListTile(
//              leading: Icon(
//                  Icons.comment,
//                  color: Colors.pink
//              ),
//              title: Text(
//                '意見反饋',
//                style: TextStyle(
////                      fontWeight: FontWeight.bold,
//                    fontSize: Adapt.px(GlobalConfig.FONTSIZE_TITLE)
//                ),
//              ),
//
//            ),
            ListTile(
              leading: Icon(
                  Icons.track_changes,
                  color: Colors.pink
              ),
              title: Text(
                '兌換會員',
                style: TextStyle(
//                      fontWeight: FontWeight.bold,
                    fontSize: Dimens.font_sp16
                ),
              ),
              trailing: Text(
                '使用兌換碼',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: Dimens.font_sp12
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildToolsCard() {
    double width =  (Adapt.screenW() - 20) / 4;
    return Container(
      color: Colors.white,
      width: Adapt.screenW(),
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 0.0, top: 30.0, right: 0.0, bottom: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              dispatch(UserPageActionCreator.onFavoritesTapped());
            },
            child: Container(
              margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
              width: width,
              child: Column(
                children: <Widget>[
                  Icon(
                      Icons.collections,
                      color: Colors.pink
                  ),
                  SizedBox(
                    height: Adapt.px(10.0),
                  ),
                  Text(
                    '我的收藏',
                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
                        fontSize: Dimens.font_sp14
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
//              dispatch(UserPageActionCreator.onWatchLogTapped());
              NavigatorUtils.push(viewService.context, SettingRouter.watchRecordListPage);
            },
            child: Container(
              margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
              width: width,
              child: Column(
                children: <Widget>[
                  Icon(
                      Icons.receipt,
                      color: Colors.pink
                  ),
                  SizedBox(
                    height: Adapt.px(10.0),
                  ),
                  Text(
                    '觀看記錄',
                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
                        fontSize: Dimens.font_sp14
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              NavigatorUtils.push(viewService.context, OrderRouter.orderRecordListPage);
            },
            child: Container(
              margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
              width: width,
              child: Column(
                children: <Widget>[
                  Icon(
                      Icons.reorder,
                      color: Colors.pink
                  ),
                  SizedBox(
                    height: Adapt.px(10.0),
                  ),
                  Text(
                    '我的訂單',
                    style: TextStyle(
        //                      fontWeight: FontWeight.bold,
                        fontSize: Dimens.font_sp14
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
            width: width,
            child: Column(
              children: <Widget>[
                Icon(
                    Icons.phone,
                    color: Colors.pink
                ),
                SizedBox(
                  height: Adapt.px(10.0),
                ),
                Text(
                  '聯繫客服',
                  style: TextStyle(
//                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.font_sp14
                  ),
                ),
              ],
            ),
          ),

        ]
      )
    );
  }

  Widget _buildHeaderCard() {
    User d = userModel.user;
    return d == null ? Container() : Container(
      color: Colors.white,
      width: Adapt.screenW(),
      height: 180,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          //用户名
          Container(
            margin: EdgeInsets.only(left: 0.0, top: 30.0, right: 0.0, bottom: 10.0),
            child: Text(

              'ID:' + d.username == null ? '' : d.username,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.font_sp16
              ),
            ),
          ),
          //用户编号
          Container(
            margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 20.0),
            child: Text(
              d.rank.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: Dimens.font_sp12
              ),
            ),
          ),
          //其它
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 20.0, bottom: 0.0),
                width: (Adapt.screenW() + 10) / 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      '每日觀看次數',
                      style: TextStyle(
                          fontSize: Dimens.font_sp14,
                          color: Colors.pink
                      ),
                    ),
                    SizedBox(
                      height: Adapt.px(10.0),
                    ),
                    Text(
//                      '30 / '+ (d.rank.id == 0 ? '5' : (d.rank.id == 1 ? '10' : '無限')),
                      d.watchedTimes.toString() + '/' + d.watchTimes.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.font_sp12
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                width: Adapt.px(1),
                height: Adapt.px(60),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
                width: (Adapt.screenW() + 10) / 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      'VIP到期時間',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: Dimens.font_sp14
                      ),
                    ),
                    SizedBox(
                      height: Adapt.px(10.0),
                    ),
                    Text(
                      '2020年12月01日',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.font_sp12
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )
        ],
      )
    );
  }

  Future < void > _onRefresh() async {

    dispatch(UserPageActionCreator.onRefresh());

  }

  // 返回每个隐藏的菜单项
  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.pink),
            new Text(
              text,
              style: TextStyle(
                  fontSize: Dimens.font_sp14
              ),
            ),
          ],
        )
    );
  }

  return Scaffold(
    body: RefreshIndicator(
      color: Colors.deepOrangeAccent,
      backgroundColor: Colors.white,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: state.scrollController,
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(50, 50, 50, 1),
            pinned: true,
            title: Text(
              '會員中心',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.font_sp18
              ),
            ),
            actions: <Widget>[

              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  NavigatorUtils.push(viewService.context, SettingRouter.settingPage);
                }
              ),

            ],
            // expandedHeight: Adapt.px(550),
            // flexibleSpace: FlexibleSpaceBar(
            //   background: _buildHeader(),
            // ),
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(Adapt.px(100)),
            //   child: _buildInfoGroup(),
            // ),
          ),
          SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: Adapt.screenW(),
                    height: 120,
                    color: Color.fromRGBO(50, 50, 50, 1),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10.0, top: 40.0, right: 10.0, bottom: 10.0),
                    // color: Colors.white,
                    //z轴的高度，设置card的阴影
                    elevation: 5.0,
                    //设置shape，这里设置成了R角
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    child: _buildHeaderCard(),
                  ),
                  Center(
                      child: Container(
                        width: 60,
                        height: 60,

                        decoration: BoxDecoration(
                            image: DecorationImage(//背景图片 ,不能与背景色同时使用
                              image: (userModel.user == null || userModel.user.avatar == null) ? AssetImage('images/empty.png') : CachedNetworkImageProvider(
                                  userModel.user.avatar
                              ),
                              alignment: Alignment.topCenter,
                              repeat: ImageRepeat.repeatY,//是否重复
                              fit: BoxFit.cover,//填充模式
                              colorFilter: ColorFilter.mode(//颜色滤镜
                                  Colors.indigoAccent[400].withOpacity(0.5),
                                  BlendMode.hardLight//混合模式
                              ),
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 3.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50)
                        ),

                      )
                  )
                ],
              )
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
              // color: Colors.white,
              //z轴的高度，设置card的阴影
              elevation: 5.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: _buildToolsCard(),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 10.0),
              // color: Colors.white,
              //z轴的高度，设置card的阴影
              elevation: 5.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: _buildCellCard(),
            ),
          )

          // _buildBody(),
          // SliverToBoxAdapter(
          //   child: Offstage(
          //     offstage:
          //     state.listDetailModel.totalPages == state.listDetailModel.page,
          //     child: Container(
          //       height: Adapt.px(80),
          //       margin: EdgeInsets.only(top: Adapt.px(30)),
          //       alignment: Alignment.topCenter,
          //       child: CircularProgressIndicator(
          //         valueColor: AlwaysStoppedAnimation(Colors.black),
          //       ),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: Adapt.px(30),
          //   ),
          // )
        ],
      ),
    )
  );

}
