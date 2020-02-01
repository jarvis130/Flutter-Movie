import 'dart:math';
import 'dart:convert' show json;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/style/dimens.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WatchLogState state, Dispatch dispatch, ViewService viewService) {

  Random random = Random(DateTime.now().millisecondsSinceEpoch);

  double w = Adapt.screenW();
  double h = w * 1.5;

  GoodProducts videoList = state.videoList;

  Widget _buildGenreChip(int id) {
    return Container(
      margin: EdgeInsets.only(right: Adapt.px(10)),
      padding: EdgeInsets.all(Adapt.px(8)),
      child: Text(
        '',
        style: TextStyle(
            color: Colors.black87,
            fontSize: Dimens.font_sp14
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(Adapt.px(20))),
    );
  }

  Widget _buildShimmerCell() {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[100],
        child: Container(
          padding: EdgeInsets.all(Adapt.px(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: Adapt.px(120),
                  height: Adapt.px(180),
                  color: Colors.grey[200]),
              SizedBox(
                width: Adapt.px(20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: Adapt.px(350),
                    height: Adapt.px(30),
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: Adapt.px(150),
                    height: Adapt.px(24),
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: Adapt.px(8),
                  ),
                  SizedBox(
                    height: Adapt.px(8),
                  ),
                  Container(
                    width: Adapt.screenW() - Adapt.px(300),
                    height: Adapt.px(24),
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: Adapt.px(8),
                  ),
                  Container(
                    width: Adapt.screenW() - Adapt.px(300),
                    height: Adapt.px(24),
                    color: Colors.grey[200],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCell(Products d) {
    return InkWell(
      onTap: () {
        dispatch(WatchLogActionCreator.cellTapped(d));
      },
      child: Column(
        // key: ValueKey<int>(d.userinfo['id']),
        children: <Widget>[
          Container(
            width: w,
            padding: EdgeInsets.all(Adapt.px(20)),
            child: Row(
              children: <Widget>[
                Container(
                  width: Adapt.px(100),
                  height: Adapt.px(100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Adapt.px(100)),
                      color: Color.fromRGBO(
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextDouble()),
                      image: d.defaultPhoto.thumb != null ? DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              d.defaultPhoto.thumb
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
                      width: Adapt.px(150),
                      child: Text(
                        d.name ?? '',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimens.font_sp14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
//                    Text(d.goodsDesc ?? '',
//                        style: TextStyle(
//                            color: Colors.grey[700], fontSize: Adapt.px(24))),
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
//                      Text('0',
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

  Widget  _build(){
    return Container(
      child: ListView(
          cacheExtent: Adapt.px(180),
          children: <Widget>[
            _buildShimmerCell(),
            _buildShimmerCell(),
            _buildShimmerCell(),
            _buildShimmerCell(),
          ]
      ),
    );
  }


  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        brightness: Brightness.light,
        title: Text(
          '觀看記錄',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.font_sp18
          ),
        ),
      ),
      body: videoList.products == null ? _build() :CustomScrollView(
        controller: state.scrollController,
        slivers: <Widget>[
          SliverGrid.extent(
              childAspectRatio: 2 / 3,
              maxCrossAxisExtent: Adapt.screenW() / 2,
              children: videoList.products.map(_buildCell).toList()
          ),
          SliverToBoxAdapter(
            child: Offstage(
              offstage: state.videoList.products.length == state.total,
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
      )
  );

}
