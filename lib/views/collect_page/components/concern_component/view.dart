import 'dart:math';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/UserListModel.dart';
import 'package:movie/style/dimens.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/widgets/keepalive_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ConcernState state, Dispatch dispatch, ViewService viewService) {

  UserListModel userListModel = state.userListModel;

  Random random = new Random(DateTime.now().millisecondsSinceEpoch);

  Widget _buildGenreChip(int id) {
    return Container(
      margin: EdgeInsets.only(right: Adapt.px(10)),
      padding: EdgeInsets.all(Adapt.px(8)),
      child: Text(
        '',
        style: TextStyle(color: Colors.black87, fontSize: Adapt.px(24)),
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

  Widget _buildCell(Users d) {
    return InkWell(
      onTap: () {
        dispatch(ConcernActionCreator.onCellTappedToListDetail(d.id.toString()));
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
                      color: Color.fromRGBO(
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextInt(255),
                          random.nextDouble()),
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
                            color: Colors.black,
                            fontSize: Dimens.font_sp16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                     Text(d.rank?.name ?? '',
                         style: TextStyle(
                             color: Colors.grey[700],
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

  return userListModel.users != null ? keepAliveWrapper(
      AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        child: ListView(
          key: ValueKey(userListModel),
          controller: state.movieController,
          cacheExtent: Adapt.px(180),
          children: userListModel.users.map(_buildCell).toList()
        )
      )
  ) : Container(
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

