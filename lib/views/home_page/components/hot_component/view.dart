import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/generated/i18n.dart';
import 'package:movie/models/enums/imagesize.dart';
import 'package:movie/models/movielist.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie/models/enums/media_type.dart';
import 'action.dart';
import 'state.dart';
import '../../action.dart';

Widget buildView(
    HotMovieState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildMoreCell() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => dispatch(
                HomePageActionCreator.onMoreTapped(state.hotMovie, MediaType.hot)
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(Adapt.px(15)),
            ),
            width: Adapt.px(250),
            height: Adapt.px(350),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    I18n.of(viewService.context).more,
                    style: TextStyle(color: Colors.black, fontSize: Adapt.px(35)),
                  ),
                  Icon(Icons.arrow_forward, size: Adapt.px(35))
                ]),
          )
        )

      ],
    );
  }

  Widget _buildCell(MovieListResult d) {
    return Padding(
      key: ValueKey(d.id),
      padding: EdgeInsets.only(left: Adapt.px(30)),
      child: GestureDetector(
        onTap: () => dispatch(HotMovieActionCreator.onCellTapped(
            d.id,
            '',
            d.title,
            d.thumb_s)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(Adapt.px(15)),
              child: CachedNetworkImage(
                fadeOutDuration: Duration(milliseconds: 200),
                fadeInDuration: Duration(milliseconds: 200),
                width: Adapt.px(250),
                height: Adapt.px(350),
                fit: BoxFit.cover,
                imageUrl: d.thumb_s,
                placeholder: (ctx, s) {
                  return Image.asset(
                    'images/CacheBG.jpg',
                    fit: BoxFit.cover,
                    width: Adapt.px(250),
                    height: Adapt.px(350),
                  );
                },
              ),
            ),
            Container(
              //alignment: Alignment.bottomCenter,
                width: Adapt.px(250),
                padding: EdgeInsets.all(Adapt.px(10)),
                child: Text(
                  d.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Adapt.px(28),
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerCell() {
    return SizedBox(
      width: Adapt.px(250),
      height: Adapt.px(350),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(
              width: Adapt.px(250),
              height: Adapt.px(350),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(Adapt.px(15)),
              ),
            ),
            SizedBox(
              height: Adapt.px(30),
            ),
            Container(
              width: Adapt.px(250),
              height: Adapt.px(30),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(Adapt.px(15)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildbody() {
    MovieListModel model = state.hotMovie;
    return AnimatedSwitcher(
        transitionBuilder: (widget, animated) {
          return SlideTransition(
            position:
            animated.drive(Tween(begin: Offset(1, 0), end: Offset.zero)),
            child: widget,
          );
        },
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        child: Container(
          key: ValueKey(model),
          height: Adapt.px(420),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            children: model.results.length > 0
                ? (model.results.map(_buildCell).toList()
              ..add(_buildMoreCell()))
                : <Widget>[
              SizedBox(
                width: Adapt.px(20),
              ),
              _buildShimmerCell(),
              SizedBox(
                width: Adapt.px(20),
              ),
              _buildShimmerCell(),
              SizedBox(
                width: Adapt.px(20),
              ),
              _buildShimmerCell(),
              SizedBox(
                width: Adapt.px(20),
              ),
              _buildShimmerCell()
            ],
          ),
        ));
  }

  return _buildbody();
}
