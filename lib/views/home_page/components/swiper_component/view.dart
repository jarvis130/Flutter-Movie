import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/actions/imageurl.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/models/enums/imagesize.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(SwiperState state, Dispatch dispatch, ViewService viewService) {
  var objState = state.swiper;
  var results = objState.results;

  return SliverToBoxAdapter(
    child: Stack(
      children: <Widget>[
        Container(
            height: Adapt.px(350),
            child: results.length == 0 ? Container() : Swiper(
              pagination: new SwiperPagination(
                alignment: Alignment.bottomLeft,
                builder: new DotSwiperPaginationBuilder(
                    activeColor: Colors.grey),
              ),
              autoplay: true,
              itemCount: results.length,
              autoplayDelay: 10000,
              duration: 1000,
              itemBuilder: (ctx, index) {
               return GestureDetector(
                 onTap: () => dispatch(
                     SwiperActionCreator.onCellTapped(results[index].id, '', '', '')
                 ),
                 child: Container(
                   decoration: BoxDecoration(
                       image: DecorationImage(
                           fit: BoxFit.cover,
                           image: CachedNetworkImageProvider(
                               results[index].url
                           )
                       )
                   ),
                   child: Container(
                     color: Colors.black26,
                     padding: EdgeInsets.fromLTRB(
                         Adapt.px(30),
                         Adapt.px(100) + Adapt.padTopH(),
                         Adapt.px(30),
                         0),
                     child: Text(
//                      objState.results[index].title,
                       '',
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: Adapt.px(60),
                           shadows: <Shadow>[
                             Shadow(offset: Offset(1, 1))
                           ]),
                     ),
                   ),
                 )
               );
              },
            )
        ),
      ],
    ),
  );
}
