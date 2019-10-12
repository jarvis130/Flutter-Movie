import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/actions/imageurl.dart';
import 'package:movie/generated/i18n.dart';
import 'package:movie/customwidgets/shimmercell.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/videolist.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NewMovieState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildListCell(MovieListResult d) {
    return GestureDetector(
        onTap: () => dispatch(NewMovieActionCreator.onCellTapped(
            d.id,
            '',
            d.title,
            d.thumb_s)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Adapt.px(15)),
              color: Colors.grey[200],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      d.thumb_s
                  )
              )
          ),
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
        )
    );
  }

  Widget _buildBody() {
    var d = state.newMovie;
    var width = Adapt.screenW() / 3;
    var height = Adapt.px(280);
    if (d.results.length > 0)
      return SliverPadding(
        padding: EdgeInsets.all(Adapt.px(20)),
        sliver: SliverGrid.extent(
          childAspectRatio: 2 / 3,
          maxCrossAxisExtent: width,
          crossAxisSpacing: Adapt.px(20),
          mainAxisSpacing: Adapt.px(20),
          children: d.results.map(_buildListCell).toList(),
        )
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

  return _buildBody();
}
