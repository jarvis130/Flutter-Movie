
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/provider/user_state.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/resources.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/views/order/order_router.dart';
import 'package:movie/views/setting/order_confirm_dialog.dart';
import 'package:movie/views/setting/setting_router.dart';
import 'package:provider/provider.dart';
import 'package:movie/widgets/share_card.dart';
import 'package:movie/utils/imageurl.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/models/enums/imagesize.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  @override
  void initState() {

//    this._getMoreData();

    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
//        _getMoreData();
      }
    });

  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _getMoreData() async {
    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
      isLoading = true;
      //视频信息
//      currentPage = currentPage + 1;
//
//      OrderListModel model = await OrderApi.orderList(page: currentPage, per_page: GlobalConfig.PageSize);
//      if (model != null){
//        setState(() {
//          _list.addAll(model.orders);
//          total = model.paged.total;
//          pages = model.paged.more;
//          size = model.paged.size;
//          currentPage = model.paged.page;
//        });
//      }
      isLoading = false;

    }
  }

  Future<void> _refresh() async {

    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
      isLoading = true;
      //视频信息
//      currentPage = 1;
//
//      OrderListModel model = await OrderApi.orderList(page: currentPage, per_page: GlobalConfig.PageSize);
//      if (model != null){
//        setState(() {
//          _list.clear();
//          _list.addAll(model.orders);
//          total = model.paged.total;
//          pages = model.paged.more;
//          size = model.paged.size;
//          currentPage = model.paged.page;
//        });
//      }
      isLoading = false;
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: RefreshIndicator(
          color: Colors.deepOrangeAccent,
          backgroundColor: Colors.white,
          onRefresh: _onRefresh,
          child: CustomScrollView(
            controller: _scrollController,
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
                        NavigatorUtils.push(context, SettingRouter.settingPage);
                      }
                  ),

                ],
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
                                  image: Provider.of<UserState>(context).avatar != null ? CachedNetworkImageProvider(
                                      Provider.of<UserState>(context).avatar
                                  ) : AssetImage('assets/images/logo.png'),
                                  alignment: Alignment.topCenter,
                                  repeat: ImageRepeat.repeatY,//是否重复
                                  fit: BoxFit.cover,//填充模式
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

            ],
          ),
        )
    );
  }

  Widget _buildHeaderCard() {
    String username = Provider.of<UserState>(context).username != null ? Provider.of<UserState>(context).username : '';
    String rank = Provider.of<UserState>(context).rank != null ? Provider.of<UserState>(context).rank : '';
    String watchTimes = Provider.of<UserState>(context).watchTimes != null ? Provider.of<UserState>(context).watchTimes : '0';
    String watchedTimes = Provider.of<UserState>(context).watchedTimes != null ? Provider.of<UserState>(context).watchedTimes : '0';

    return Container(
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
//                'ID:' + d.username == null ? '' : d.username,
                username,
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
                rank,
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
                        watchedTimes + '/' + watchTimes,
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
//                  dispatch(UserPageActionCreator.onFavoritesTapped());
                  Navigator.of(context).pushNamed('CollectPage');
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
                  NavigatorUtils.push(context, SettingRouter.watchRecordListPage);
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
                  NavigatorUtils.push(context, OrderRouter.orderRecordListPage);
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
              GestureDetector(
                onTap: (){
                  NavigatorUtils.push(context, SettingRouter.kefuSettingsPage);
                },
                child: Container(
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
              ),


            ]
        )
    );
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
                    context: context,
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
              NavigatorUtils.push(context, SettingRouter.bindingPhonePage);
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
            onTap: (
                _share
            )
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
//          ListTile(
//            leading: Icon(
//                Icons.track_changes,
//                color: Colors.pink
//            ),
//            title: Text(
//              '兌換會員',
//              style: TextStyle(
////                      fontWeight: FontWeight.bold,
//                  fontSize: Dimens.font_sp16
//              ),
//            ),
//            trailing: Text(
//              '使用兌換碼',
//              style: TextStyle(
//                  color: Colors.grey,
//                  fontSize: Dimens.font_sp12
//              ),
//            ),
//          ),
        ],
      ),
    );
  }

  Future < void > _onRefresh() async {
//    dispatch(UserPageActionCreator.onRefresh());
  }

  Future < void > _share() {
    String userId = Provider.of<UserState>(context).userId != null ? Provider.of<UserState>(context).userId.toString() : '0';

    showDialog(
        context: context,
        builder: (ctx) {
          var width = (Adapt.screenW() - Adapt.px(60)).floorToDouble();
          var height = ((width - Adapt.px(40)) / 2).floorToDouble();
          return ShareCard(
            backgroundImage: ImageUrl.getUrl('assets/images/logo.png', ImageSize.w300),
            qrValue: GlobalConfig.shareUrl +'?id='+userId,
            headerHeight: height,
            header: Column(children: <Widget>[
              SizedBox(
                height: Adapt.px(20),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: Adapt.px(20),
                  ),
                  Container(
                    width: Adapt.px(120),
                    height: Adapt.px(120),
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.white, width: Adapt.px(5)),
                        borderRadius: BorderRadius.circular(Adapt.px(60)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/logo.png'),
                        )
                    ),
                  ),
                  SizedBox(
                    width: Adapt.px(20),
                  ),
                  Container(
                    width: width - Adapt.px(310),
                    child: Text(
                        '秘秀Slices',
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimens.font_sp22,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(offset: Offset(Adapt.px(1), Adapt.px(1)))
                            ])),
                  ),
                ],
              ),
              SizedBox(
                height: Adapt.px(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
                width: width - Adapt.px(40),
                height: height - Adapt.px(170),
                child: Text(
                    '带给你最好的福利视频',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.font_sp16,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(Adapt.px(1), Adapt.px(1)),
                              blurRadius: 3)
                        ])),
              )
            ]),
          );
        });
  }
}
