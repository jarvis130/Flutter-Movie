
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie/api/classify_api.dart';
import 'package:movie/api/home_api.dart';
import 'package:movie/api/product_api.dart';
import 'package:movie/common/common.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/HomeModel.dart';
import 'package:movie/models/VideoAttributeModel.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/style/dimens.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/views/detail/detail_router.dart';
import 'package:movie/widgets/image/cache_img_radius.dart';
import 'package:movie/widgets/loading_widget.dart';
import 'package:movie/widgets/rating_bar.dart';
import 'package:movie/widgets/shimmercell.dart';
import 'dart:math' as math;

import 'package:movie/widgets/subject_mark_image_widget.dart';
class DiscoverPage extends StatefulWidget {


  DiscoverPage({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _DiscoverPageState();
  }
}

class _DiscoverPageState extends State<DiscoverPage>  with AutomaticKeepAliveClientMixin {
  bool loading = true;

  List<Products> productList = new List<Products>();
  ScrollController scrollController;
  AnimationController animationController;
  AnimationController cellAnimationController;
  bool isPerformingRequest;
  int currentPage = 0;
  int total = 0;
  int size = 0;
  int pages = 0;
  //属性查询状态
  List atrributionList1;
  List atrributionList2;
  List atrributionList3;
  int groupValue1;
  int groupValue2;
  int groupValue3;
  String groupTitle1;
  String groupTitle2;
  String groupTitle3;

  var hotChildAspectRatio;
  var comingSoonChildAspectRatio;
  int selectIndex = 0; //选中的是热映、即将上映
  var itemW;
  var imgSize;

  final List list1 =[
    {
      "title": "最近热播",
      "value":0,
    },
    {
      "title": "最新上架",
      "value":1
    },
    {
      "title": "热门推荐",
      "value":2
    }
  ];

  void requestAPI() async {

    VideoAttributeModel videoAttributeModel = await ClassifyApi.getVideoAttribute();
    if(videoAttributeModel != null){
      Map map = {
        'list1': list1,
        'list2': videoAttributeModel.videoarea,
        'list3': videoAttributeModel.videotype
      };
      setState(() {
        atrributionList1 = list1;
        atrributionList2 = videoAttributeModel.videoarea;
        atrributionList3 = videoAttributeModel.videotype;
        groupValue1 = 0;
        groupValue2 = 0;
        groupValue3 = 0;
      });
    }

    //
    int curPage = currentPage + 1;
    int is_hot = 0;
    int is_new = 0;
    int is_best = 0;
    String title1 = '';
    String title2 = '';
    if(groupValue1 == 0){
      // 热播
      is_hot = 1;
    }else if(groupValue1 == 1){
      is_new = 1;
    }else{
      is_best = 1;
    }
    if(groupTitle2 != '全部'){
      title1 = groupTitle2;
    }
    if(groupTitle3 != '全部'){
      title2 = groupTitle3;
    }
    GoodProducts model = await ProductApi.getList(
        page: curPage,
        per_page: GlobalConfig.PageSize,
        is_hot: is_hot,
        is_best: is_best,
        is_new: is_new,
        attr_value1: title1,
        attr_value2: title2,
        is_real: '2'
    );
    if (model != null){
      setState(() {
        productList.addAll(model.products);
        total = model.paged.total;
        pages = model.paged.more;
        size = model.paged.size;
        currentPage = model.paged.page;
      });
    }
    setState(() {
      loading = false;
    });
  }

  void updateValue(Map map) async {

      setState(() {
        loading = true;
        if(map['group'] == 1){
          groupTitle1 =  map['title'];
          groupValue1 =  map['value'];
        }else if(map['group'] == 2){
          groupTitle2 =  map['title'];
          groupValue2 =  map['value'];
        }else if(map['group'] == 3){
          groupTitle3 =  map['title'];
          groupValue3 =  map['value'];
        }
        currentPage = 0;
      });


    //
    int curPage = currentPage + 1;
    int is_hot = 0;
    int is_new = 0;
    int is_best = 0;
    String title1 = '';
    String title2 = '';
    if(groupValue1 == 0){
      // 热播
      is_hot = 1;
    }else if(groupValue1 == 1){
      is_new = 1;
    }else{
      is_best = 1;
    }
    if(groupTitle2 != '全部'){
      title1 = groupTitle2;
    }
    if(groupTitle3 != '全部'){
      title2 = groupTitle3;
    }
    GoodProducts model = await ProductApi.getList(
        page: curPage,
        per_page: GlobalConfig.PageSize,
        is_hot: is_hot,
        is_best: is_best,
        is_new: is_new,
        attr_value1: title1,
        attr_value2: title2,
        is_real: '2'
    );
    if (model != null){
      setState(() {
        productList.addAll(model.products);
        total = model.paged.total;
        pages = model.paged.more;
        size = model.paged.size;
        currentPage = model.paged.page;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      groupValue1 = 0;
      groupValue2 = 0;
      groupValue3 = 0;
    });
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
                  '發現',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.font_sp18
                  ),
                ),
                actions: <Widget>[],
              ),
            ];
          },
          body: Stack(
            children: <Widget>[
              containerBody(),
              Offstage(
                child: LoadingWidget.getLoading(backgroundColor: Colors.transparent),
                offstage: !loading,
              )
            ],
          )
      ),
    );
  }

  Widget _build_button_default(value, groupVal){
    String val = value['title'];
    int n = val.length;
    return n > 2 ? FlatButton(
        onPressed: (){
//          dispatch(ClassifyActionCreator.onUpdateGroupValue({
//            'group': groupVal,
//            'title': value['title'],
//            'value': value['value']
//          }));
          updateValue({
            'group': groupVal,
            'title': value['title'],
            'value': value['value']
          });
        },
        child: Text(
            val,
            style: TextStyle(
                color: Color(0xFFEAEAEA),
                fontSize: Dimens.font_sp14
            )
        )
    ) : Container(
      width: 65,
      child: FlatButton(
          onPressed: (){
//            dispatch(ClassifyActionCreator.onUpdateGroupValue({
//              'group': groupVal,
//              'title': value['title'],
//              'value': value['value']
//            }));
            updateValue({
              'group': groupVal,
              'title': value['title'],
              'value': value['value']
            });
          },
          child: Text(
              val,
              style: TextStyle(
                  color: Color(0xFFEAEAEA),
                  fontSize: Dimens.font_sp14
              )
          )
      ),
    );
  }

  Widget _build_button_selected(value, groupVal){
    String val = value['title'];
    int n = val.length;
    return n > 2 ? FlatButton(
        color: Color(0xFFEAEAEA),
        onPressed: (){
//          dispatch(ClassifyActionCreator.onUpdateGroupValue({
//            'group': groupVal,
//            'title': value['title'],
//            'value': value['value']
//          }));
          updateValue({
            'group': groupVal,
            'title': value['title'],
            'value': value['value']
          });
        },
        child: Text(
            val,
            style: TextStyle(
                color: Colors.orange,
                fontSize: Dimens.font_sp16
            )
        )
    ) : Container(
      width: 65,
      child: FlatButton(
          color: Color(0xFFEAEAEA),
          onPressed: (){
//            dispatch(ClassifyActionCreator.onUpdateGroupValue({
//              'group': groupVal,
//              'title': value['title'],
//              'value': value['value']
//            }));
            updateValue({
              'group': groupVal,
              'title': value['title'],
              'value': value['value']
            });
          },
          child: Text(
              val,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: Dimens.font_sp16
              )
          )
      ),
    );
  }

  Widget _build_cell(value, group) {
    if(group == 1){
      return groupValue1==value['value'] ? _build_button_selected(value, 1):_build_button_default(value, 1);
    }else if(group == 2){
      return groupValue2==value['value'] ? _build_button_selected(value, 2):_build_button_default(value, 2);
    }else{
      return groupValue3==value['value'] ? _build_button_selected(value, 3):_build_button_default(value, 3);
    }
  }

  Widget _shimmer_cell(){
    return Container(
      margin: EdgeInsets.only(
          top: Adapt.px(5), left: Adapt.px(20), right: Adapt.px(20)
      ),
      child: ShimmerCell(Adapt.px(100), Adapt.px(20), Adapt.px(0)),
    );
  }

  Widget _build_menu_shimmer_cell(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: <Widget>[
          _shimmer_cell(),
          _shimmer_cell(),
          _shimmer_cell(),
          _shimmer_cell(),
          _shimmer_cell(),
          _shimmer_cell(),
          _shimmer_cell(),
          _shimmer_cell()
        ],
      ),
    );
  }

  Widget _build1(){
    if(atrributionList1 == null){
      return _build_menu_shimmer_cell();
    }
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: atrributionList1.map((value) {
          return _build_cell(value, 1);
        }).toList(),
      ),
    );
  }

  Widget _build2(){
    if(atrributionList2 == null){
      return _build_menu_shimmer_cell();
    }
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: atrributionList2.map((value) {
          return _build_cell(value, 2);
        }).toList(),
      ),
    );
  }

  Widget _build3(){
    if(atrributionList3 == null){
      return _build_menu_shimmer_cell();
    }
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: atrributionList3.map((value) {
          return _build_cell(value, 3);
        }).toList(),
      ),
    );
  }

  ///影院热映item
  Widget _getHotMovieItem(Products bean, var itemW) {
    if (bean == null) {
      return Container();
    }
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            SubjectMarkImageWidget(
              bean.defaultPhoto.thumb,
              width: itemW,
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
//        Navigator.of(context).pushNamed('moviedetailpage', arguments: {
//          'movieid': bean.id.toString(),
//          'bgpic': bean.defaultPhoto.thumb,
//          'title': bean.name,
//          'posterpic': bean.defaultPhoto.thumb,
//        });

        NavigatorUtils.push(context, '${DetailRouter.detailPage}?subjectId=${bean.id.toString()}&id=${bean.id.toString()}');
      },
    );
  }

  ///图片+订阅+名称+星标
  SliverGrid getCommonSliverGrid(List<Products> beans) {
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
  getCommonImg(String url, OnTab onTab) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: CacheImgRadius(
          imgUrl: url,
          radius: 5.0,
          onTab: () {
            if (onTab != null) {
              onTab();
            }
          },
        ),
      ),
    );
  }

  Widget containerBody() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _build1(),
          ),
          SliverToBoxAdapter(
            child: _build2(),
          ),
          SliverToBoxAdapter(
            child: _build3(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Adapt.px(20),
            ),
          ),
          getCommonSliverGrid(productList),


        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

typedef OnTab = void Function();
