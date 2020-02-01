import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/Adapt.dart';
import 'package:movie/widgets/shimmercell.dart';
import 'package:movie/models/GoodProducts.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'action.dart';
import 'state.dart';



Widget buildView(FavoritesState state, Dispatch dispatch, ViewService viewService) {

 GoodProducts goods =  state.favoritesList;

 Widget _buildListCell(Products d) {
    return GestureDetector(
        onTap: () {
          dispatch(FavoritesActionCreator.onCellTapped(d.id.toString(), d.defaultPhoto.thumb, d.name, d.defaultPhoto.thumb));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      d.defaultPhoto.thumb
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

    var width = Adapt.screenW() / 3;
    var height = Adapt.px(300);
    if (goods.products != null)
      return SliverGrid.extent(
        childAspectRatio: 2 / 3,
        maxCrossAxisExtent: width,
        crossAxisSpacing: Adapt.px(10),
        mainAxisSpacing: Adapt.px(10),
        children: goods.products.map(_buildListCell).toList(),
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

  return CustomScrollView(
    slivers: <Widget>[
      _buildBody()
    ],
  );
}
