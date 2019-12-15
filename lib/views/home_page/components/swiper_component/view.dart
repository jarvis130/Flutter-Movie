import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/models/BannerModel.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(SwiperState state, Dispatch dispatch, ViewService viewService) {
  BannerModel model = state.swiper;

  Widget _buildBanner(BannerModel model){
    int count = model.banners.length;
    List banners = model.banners;
    return Container(
        height: Adapt.px(350),
        child: Swiper(
          pagination: new SwiperPagination(
            alignment: Alignment.bottomLeft,
            builder: new DotSwiperPaginationBuilder(
                activeColor: Colors.grey
            ),
          ),
          autoplay: true,
          itemCount: count,
          autoplayDelay: 5000,
          duration: 1000,
          itemBuilder: (ctx, index) {
            return GestureDetector(
                onTap: () => dispatch(
                    SwiperActionCreator.onCellTapped(banners[index].id.toString(), '', '', '')
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              banners[index].photo.thumb
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
    );
  }

  if(model.banners != null){
    _buildBanner(model);
    return SliverToBoxAdapter(
      child: Stack(
        children: <Widget>[
          _buildBanner(model)
        ],
      ),
    );
  }else{
    return SliverToBoxAdapter(
      child: Stack(
          children: <Widget>[
            Container()
          ]
      ),
    );
  }

}
