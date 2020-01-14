import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/customwidgets/shimmercell.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/GoodProducts.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ClassifyPageState state, Dispatch dispatch, ViewService viewService) {

  Widget _build_button_default(value, groupVal){
    String val = value['title'];
    int n = val.length;
    return n > 2 ? FlatButton(
        onPressed: (){
//        print('切换${value}');
          dispatch(ClassifyActionCreator.onUpdateGroupValue({
            'group': groupVal,
            'title': value['title'],
            'value': value['value']
          }));
        },
        child: Text(
            val,
            style: TextStyle(
                fontSize: Adapt.px(28)
            )
        )
    ) : Container(
      width: 65,
      child: FlatButton(
          onPressed: (){
//        print('切换${value}');
            dispatch(ClassifyActionCreator.onUpdateGroupValue({
              'group': groupVal,
              'title': value['title'],
              'value': value['value']
            }));
          },
          child: Text(
              val,
              style: TextStyle(
                  fontSize: Adapt.px(28)
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
//        print('切换${value}');
        dispatch(ClassifyActionCreator.onUpdateGroupValue({
          'group': groupVal,
          'title': value['title'],
          'value': value['value']
        }));
      },
      child: Text(
          val,
          style: TextStyle(
              color: Colors.orange,
              fontSize: Adapt.px(28)
          )
      )
    ) : Container(
      width: 65,
      child: FlatButton(
          color: Color(0xFFEAEAEA),
          onPressed: (){
//        print('切换${value}');
            dispatch(ClassifyActionCreator.onUpdateGroupValue({
              'group': groupVal,
              'title': value['title'],
              'value': value['value']
            }));
          },
          child: Text(
              val,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: Adapt.px(28)
              )
          )
      ),
    );
  }

  Widget _build_cell(value, group) {
    if(group == 1){
      return state.groupValue1==value['value'] ? _build_button_selected(value, 1):_build_button_default(value, 1);
    }else if(group == 2){
      return state.groupValue2==value['value'] ? _build_button_selected(value, 2):_build_button_default(value, 2);
    }else{
      return state.groupValue3==value['value'] ? _build_button_selected(value, 3):_build_button_default(value, 3);
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
    return state.atrributionList1 == null ? _build_menu_shimmer_cell() : Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: state.atrributionList1.map((value) {
          return _build_cell(value, 1);
        }).toList(),
      ),
    );
  }

  Widget _build2(){
    return state.atrributionList2 == null ? _build_menu_shimmer_cell() : Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: state.atrributionList2.map((value) {
          return _build_cell(value, 2);
        }).toList(),
      ),
    );
  }

  Widget _build3(){
    return state.atrributionList3 == null ? _build_menu_shimmer_cell() : Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 28.0,
      child: ListView(
        //设置水平方向排列
        scrollDirection: Axis.horizontal,
        //添加子元素
        children: state.atrributionList3.map((value) {
          return _build_cell(value, 3);
        }).toList(),
      ),
    );
  }

//  return MaterialApp(
//    title: title,
//    home: Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//      ),
//      body: Column(
//        children: <Widget>[
//          _build1(),
//          _build2(),
//          _build3(),
//        ],
//      )
//    ),
//  );

  Random random = Random(DateTime.now().millisecondsSinceEpoch);

//  Widget _buildCell(Products d) {
//
//    int index = state.productList.indexOf(d);
//    double w = Adapt.screenW() / 2;
//    double h = w * 1.5;
//    var curve = CurvedAnimation(
//      parent: state.animationController,
//      curve: Interval(
//        index * (1.0 / state.productList.length),
//        (index + 1) * (1.0 / state.productList.length),
//        curve: Curves.ease,
//      ),
//    );
//
//    return SlideTransition(
//      position:Tween(begin: Offset(0,1),end: Offset.zero).animate(curve),
//      child:FadeTransition(
//        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curve),
//        child:  GestureDetector(
//          onTap: () {
////            dispatch(MoreMediaPageActionCreator.cellTapped(d.id.toString(), d.goodsName ?? d.goodsName, d.defaultPhoto.thumb, d.defaultPhoto.thumb);
//          },
//          child: Container(
//            alignment: Alignment.bottomLeft,
//            width: w,
//            height: h,
//            padding: EdgeInsets.all(Adapt.px(10)),
//            decoration: BoxDecoration(
//                color: Color.fromRGBO(random.nextInt(255), random.nextInt(255),
//                    random.nextInt(255), random.nextDouble()),
//                image: DecorationImage(
//                    fit: BoxFit.cover,
//                    image: d.defaultPhoto == null ? AssetImage('images/empty.png') :CachedNetworkImageProvider(
//                         d.defaultPhoto.thumb
//                    )
//                )
//            ),
//            child: Column(
//              children: <Widget>[
//                Container(
//                  alignment: Alignment.topRight,
//                  child: Row(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      Icon(
//                        Icons.star,
//                        color: Colors.white,
//                        size: Adapt.px(30),
//                      ),
//                      SizedBox(
//                        width: Adapt.px(5),
//                      )
//                    ],
//                  ),
//                ),
//                Expanded(
//                  child: SizedBox(),
//                ),
//                Row(
//                  children: <Widget>[
//                    Container(
//                      width: w - Adapt.px(10) * 2,
//                      child: Text(
//                        d.goodsName,
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: Adapt.px(30),
//                            fontWeight: FontWeight.bold,
//                            shadows: <Shadow>[
//                              Shadow(
//                                  blurRadius: 3,
//                                  //offset: Offset(Adapt.px(1),Adapt.px(1)),
//                                  color: Colors.black87
//                              )
//                            ]
//                        )
//                      ),
//                    )
//                  ],
//                )
//              ],
//            ),
//          ),
//        ),
//      )
//      ,
//    );
//  }

  Widget _buildCell(Products d) {

    double w = Adapt.screenW() / 3;
    double h = w * 1.5;

    return GestureDetector(
            onTap: () => dispatch(
                ClassifyActionCreator.cellTapped(d.id.toString(), d.goodsName, d.defaultPhoto.thumb, d.defaultPhoto.thumb)
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          width: w,
          height: h,
    //      padding: EdgeInsets.all(Adapt.px(10)),
          decoration: BoxDecoration(
              color: Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                  random.nextInt(255), random.nextDouble()),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: d.defaultPhoto == null ? AssetImage('images/empty.png') :CachedNetworkImageProvider(
                      d.defaultPhoto.thumb
                  )
              )
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
    //                Icon(
    //                  Icons.star,
    //                  color: Colors.white,
    //                  size: Adapt.px(30),
    //                ),
                    SizedBox(
                      width: Adapt.px(5),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: Adapt.px(0), left: Adapt.px(10), right: Adapt.px(0)
                    ),
                    width: w - Adapt.px(10) * 2,
                    child: Text(
                        d.goodsName,
                        overflow: TextOverflow
                            .ellipsis, //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Adapt.px(22),
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                  blurRadius: 3,
                                  offset: Offset(Adapt.px(1),Adapt.px(1)),
                                  color: Colors.black87
                              )
                            ]
                        )
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  Widget _shimmerCell(){
    return Container(
//      margin: EdgeInsets.only(
//          top: Adapt.px(5), left: Adapt.px(20), right: Adapt.px(20)
//      ),
      child: ShimmerCell(
          Adapt.px(100),
          Adapt.px(100) * 1.5,
          Adapt.px(0)
      ),
    );
  }

  Widget _buildShimmerCell(){
    return SliverGrid.extent(
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 2 / 3,
        maxCrossAxisExtent: Adapt.screenW() / 3,
        children: <Widget>[
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell(),
          _shimmerCell()
        ],
    );
  }

  Future < void > _onRefresh() async {

    dispatch(
        ClassifyActionCreator.onRefresh()
    );
  }

  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        title: Text(
          '發現',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Adapt.px(GlobalConfig.FONTSIZE_NAVIGATION)
          ),
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: state.scrollController,
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
            state.productList != null ? SliverGrid.extent(
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 2 / 3,
                maxCrossAxisExtent: Adapt.screenW() / 3,
                children: state.productList.map(_buildCell).toList()
            ) : _buildShimmerCell(),

            SliverToBoxAdapter(
              child: Offstage(
                offstage: state.productList.length == state.total,
                child: Container(
                  height: Adapt.px(120),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      )


  );

}
