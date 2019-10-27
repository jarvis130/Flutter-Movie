import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/actions/imageurl.dart';
import 'package:movie/customwidgets/shimmercell.dart';
import 'package:movie/generated/i18n.dart';
import 'package:movie/models/enums/imagesize.dart';
import 'package:movie/models/enums/media_type.dart';
import 'package:movie/models/videolist.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {

  TextStyle _selectPopStyle = TextStyle(
      fontSize: Adapt.px(24), fontWeight: FontWeight.bold, color: Colors.white);

  TextStyle _unselectPopStyle =
      TextStyle(fontSize: Adapt.px(24), color: Colors.grey);

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () => dispatch(HomePageActionCreator.onSearchBarTapped()),
      child: Container(
          padding: EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30)),
          height: Adapt.px(70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Adapt.px(40)),
            color: Color.fromRGBO(57, 57, 57, 1),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: Adapt.px(20),
              ),
              Text(
                I18n.of(viewService.context).searchbartxt,
                style: TextStyle(color: Colors.grey, fontSize: Adapt.px(28)),
              )
            ],
          )),
    );
  }

  Widget _buildHeaderTitel() {
    var _selectTextStyle = TextStyle(
        color: Colors.white,
        fontSize: Adapt.px(40),
        fontWeight: FontWeight.bold);
    var _unselectTextStyle =
        TextStyle(color: Colors.grey, fontSize: Adapt.px(40));
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () =>
                  dispatch(HomePageActionCreator.onHeaderFilterChanged(true)),
              child: Text(I18n.of(viewService.context).inTheaters,
                  style: state.showHeaderMovie
                      ? _selectTextStyle
                      : _unselectTextStyle),
            ),
            SizedBox(
              width: Adapt.px(30),
            ),
            InkWell(
              onTap: () =>
                  dispatch(HomePageActionCreator.onHeaderFilterChanged(false)),
              child: Text(
                I18n.of(viewService.context).onTV,
                style: state.showHeaderMovie
                    ? _unselectTextStyle
                    : _selectTextStyle,
              ),
            )
          ],
        ));
  }

  Widget _buildHeaderListCell(VideoListResult f) {
    String name = f.title ?? f.title;
    return Padding(
        key: ValueKey('headercell' + f.id.toString()),
        padding: EdgeInsets.only(left: Adapt.px(30)),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => dispatch(HomePageActionCreator.onCellTapped(
                  f.id,
                  f.thumb_s,
                  name,
                  f.thumb_s,
                  state.showHeaderMovie ? MediaType.movie : MediaType.tv)),
              child: Container(
                width: Adapt.px(200),
                height: Adapt.px(280),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(57, 57, 57, 1),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            ImageUrl.getUrl(f.thumb_s, ImageSize.w300)))),
              ),
            ),
            SizedBox(
              height: Adapt.px(20),
            ),
            Container(
              alignment: Alignment.center,
              width: Adapt.px(200),
              height: Adapt.px(70),
              child: Text(name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: Adapt.px(26))),
            ),
          ],
        ));
  }

  Widget _buildShimmerHeaderCell() {
    Color _baseColor = Color.fromRGBO(57, 57, 57, 1);
    Color _highLightColor = Color.fromRGBO(67, 67, 67, 1);
    return Shimmer.fromColors(
        baseColor: _baseColor,
        highlightColor: _highLightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: Adapt.px(200),
              height: Adapt.px(280),
              color: _baseColor,
            ),
            SizedBox(
              height: Adapt.px(20),
            ),
            Container(
              width: Adapt.px(200),
              height: Adapt.px(20),
              color: _baseColor,
            ),
            SizedBox(
              height: Adapt.px(8),
            ),
            Container(
              width: Adapt.px(150),
              height: Adapt.px(20),
              color: _baseColor,
            ),
          ],
        ));
  }

  Widget _buildHeaderBody() {
    var _model = state.showHeaderMovie ? state.movie : state.tv;
    return Container(
      height: Adapt.px(400),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: ListView(
            key: ValueKey(_model),
            scrollDirection: Axis.horizontal,
            children: _model.results.length > 0
                ? _model.results.map(_buildHeaderListCell).toList()
                : <Widget>[
                    SizedBox(
                      width: Adapt.px(30),
                    ),
                    _buildShimmerHeaderCell(),
                    SizedBox(
                      width: Adapt.px(30),
                    ),
                    _buildShimmerHeaderCell(),
                    SizedBox(
                      width: Adapt.px(30),
                    ),
                    _buildShimmerHeaderCell(),
                  ]),
      ),
    );
  }

  Widget _buildSwiperCardCell(VideoListResult d) {
    return GestureDetector(
//        key: ValueKey('card${d.id}'),
        onTap: () => dispatch(HomePageActionCreator.onCellTapped(
            d.id,
            d.thumb_s,
            d.title ?? d.title,
            d.thumb_s,
            state.showHeaderMovie ? MediaType.movie : MediaType.tv)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(0, Adapt.px(20)),
                      blurRadius: Adapt.px(30),
                      spreadRadius: Adapt.px(1)),
                ],
              ),
              margin: EdgeInsets.fromLTRB(
                  Adapt.px(30), Adapt.px(5), Adapt.px(30), Adapt.px(30)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: Adapt.px(120),
                    height: Adapt.px(170),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(ImageUrl.getUrl(
                                d.thumb_s, ImageSize.w300)))),
                  ),
                  SizedBox(
                    width: Adapt.px(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: Adapt.px(20),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: Adapt.screenW() - Adapt.px(450),
                            child: Text(
                              d.title ?? d.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: Adapt.px(35)),
                            ),
                          ),
                          // Container(
                          //   width: Adapt.px(160),
                          //   child: FlutterRatingBarIndicator(
                          //     emptyColor: Colors.grey[300],
                          //     itemSize: Adapt.px(22),
                          //     itemPadding: EdgeInsets.only(right: Adapt.px(8)),
                          //     rating: d.vote_average / 2,
                          //   ),
                          // ),
                          // Text(
                          //   d.vote_average.toStringAsFixed(1),
                          //   style: TextStyle(
                          //       fontSize: Adapt.px(22),
                          //       fontWeight: FontWeight.w700),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: Adapt.px(20),
                      ),
                      Container(
                        width: Adapt.screenW() - Adapt.px(210),
                        child: Text(
                          d.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey, fontSize: Adapt.px(24)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildSwiper() {
    var _model = state.showHeaderMovie ? state.movie : state.tv;
    Widget _child = _model.results.length > 0
        ? Swiper(
            key: ValueKey(_model),
            autoplay: true,
            duration: 1000,
            autoplayDelay: 10000,
            viewportFraction: 0.9999,
            itemCount: _model.results.length,
            itemBuilder: (ctx, index) {
              var d = _model.results[index];
              return _buildSwiperCardCell(d);
            },
          )
        : Container(
            margin: EdgeInsets.only(bottom: Adapt.px(55)),
            child:
                ShimmerCell(Adapt.screenW() - Adapt.px(60), Adapt.px(170), 0),
          );
    return Container(
      height: Adapt.px(225),
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 600),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: _child),
    );
  }

  Widget _buildTitle(String title, void buttonTap(),
      {IconData d = Icons.more_vert}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Adapt.px(20), 0, Adapt.px(20), 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: Adapt.px(45),
                fontWeight: FontWeight.w700),
          ),
          IconButton(
            padding: EdgeInsets.only(right: 0),
            alignment: Alignment.centerRight,
            icon: Icon(d),
            onPressed: () => buttonTap(),
          )
        ],
      ),
    );
  }

  Widget _buildFrontTitel(String title, Widget action,
      {EdgeInsetsGeometry padding =
          const EdgeInsets.symmetric(horizontal: 20)}) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: Adapt.px(35),
                fontWeight: FontWeight.bold),
          ),
          action
        ],
      ),
    );
  }

  Widget _buildTrending() {
//    double _size = (Adapt.screenW() - Adapt.px(70)) / 2;
//    Widget _child = state.trending.results.length > 0
//        ? StaggeredGridView.countBuilder(
//            key: ValueKey('Trending'),
//            physics: NeverScrollableScrollPhysics(),
//            shrinkWrap: true,
//            crossAxisCount: 4,
//            staggeredTileBuilder: (int index) =>
//                new StaggeredTile.count(2, index == 0 ? 2 : 1),
//            mainAxisSpacing: Adapt.px(5),
//            crossAxisSpacing: Adapt.px(5),
//            itemCount: 3,
//            itemBuilder: (BuildContext contxt, int index) {
//              var d = state.trending.results[index];
//              return GestureDetector(
//                  onTap: () => dispatch(HomePageActionCreator.onCellTapped(
//                      d.id,
//                      d.backdropPath,
//                      d.title ?? d.name,
//                      d.posterPath,
//                      d.title != null ? MediaType.movie : MediaType.tv)),
//                  child: Container(
//                    padding: EdgeInsets.symmetric(horizontal: Adapt.px(10)),
//                    alignment: Alignment.bottomLeft,
//                    decoration: BoxDecoration(
//                        color: Colors.grey[200],
//                        image: DecorationImage(
//                            fit: BoxFit.cover,
//                            image: CachedNetworkImageProvider(ImageUrl.getUrl(
//                                d.backdropPath, ImageSize.w400)))),
//                    child: Text(
//                      d.title ?? d.name,
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: Adapt.px(30),
//                          fontWeight: FontWeight.bold,
//                          shadows: <Shadow>[Shadow(offset: Offset(1, 1))]),
//                    ),
//                  ));
//            },
//          )
//        : Shimmer.fromColors(
//            baseColor: Colors.grey[200],
//            highlightColor: Colors.grey[100],
//            child: Row(
//              children: <Widget>[
//                Container(
//                  width: _size,
//                  height: _size,
//                  color: Colors.grey[200],
//                ),
//                SizedBox(
//                  width: Adapt.px(10),
//                ),
//                Column(
//                  children: <Widget>[
//                    Container(
//                      width: _size,
//                      height: (_size - Adapt.px(10)) / 2,
//                      color: Colors.grey[200],
//                    ),
//                    SizedBox(
//                      height: Adapt.px(10),
//                    ),
//                    Container(
//                      width: _size,
//                      height: (_size - Adapt.px(10)) / 2,
//                      color: Colors.grey[200],
//                    )
//                  ],
//                )
//              ],
//            ),
//          );
//    return Padding(
//        padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
//        child: AnimatedSwitcher(
//          duration: Duration(milliseconds: 600),
//          switchInCurve: Curves.easeIn,
//          switchOutCurve: Curves.easeOut,
//          child: _child,
//        ));
  }

  Widget _buildPopularposter() {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Adapt.px(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  I18n.of(viewService.context).popular,
                  style: state.showPopMovie
                      ? _selectPopStyle
                      : _unselectPopStyle,
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () => dispatch(
                      HomePageActionCreator.onPopularFilterChanged(true)),
                  child: Text(I18n.of(viewService.context).movies,
                      style: state.showPopMovie
                          ? _unselectPopStyle
                          : _selectPopStyle),
                ),
                SizedBox(
                  width: Adapt.px(20),
                ),
                GestureDetector(
                  onTap: () => dispatch(
                      HomePageActionCreator.onPopularFilterChanged(
                          false)),
                  child: Text(I18n.of(viewService.context).tvShows,
                      style: TextStyle(
                          fontSize: Adapt.px(24),
                          fontWeight: state.showPopMovie
                              ? FontWeight.normal
                              : FontWeight.bold,
                          color: state.showPopMovie
                              ? Colors.grey
                              : Colors.black)),
                )
              ],
            ),
          ),
          viewService.buildComponent('popularposter'),
        ],
      ),
    );
  }

  Widget _buildPopular() {
    return SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Adapt.px(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    I18n.of(viewService.context).recommendations,
                    style: state.showPopMovie
                        ? _selectPopStyle
                        : _unselectPopStyle,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () => dispatch(
                        HomePageActionCreator.onPopularFilterChanged(true)),
                    child: Text(I18n.of(viewService.context).movies,
                        style: state.showPopMovie
                            ? _unselectPopStyle
                            : _selectPopStyle),
                  ),
                  SizedBox(
                    width: Adapt.px(20),
                  ),
                  GestureDetector(
                    onTap: () => dispatch(
                        HomePageActionCreator.onPopularFilterChanged(
                            false)),
                    child: Text(I18n.of(viewService.context).tvShows,
                        style: TextStyle(
                            fontSize: Adapt.px(24),
                            fontWeight: state.showPopMovie
                                ? FontWeight.normal
                                : FontWeight.bold,
                            color: state.showPopMovie
                                ? Colors.grey
                                : Colors.black)),
                  )
                ],
              ),
            ),
            viewService.buildComponent('popular'),
          ],
        )
    );
  }

  Widget _buildNewMovieHeader() {
    return SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30), top: Adapt.px(30), bottom: Adapt.px(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    I18n.of(viewService.context).newMovie,
                    style: _selectPopStyle,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () => dispatch(
                        HomePageActionCreator.onMoreTapped(state.newMovie, MediaType.newMovie)
                    ),
                    child: Text(I18n.of(viewService.context).more,
                        style: _unselectPopStyle),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget _buildHotMovie() {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Adapt.px(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  I18n.of(viewService.context).popular,
                  style: _selectPopStyle,
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () => dispatch(
                      HomePageActionCreator.onMoreTapped(state.hotMovie, MediaType.hot)
                  ),
                  child: Text(I18n.of(viewService.context).more,
                      style: _unselectPopStyle),
                ),
                
              ],
            ),
          ),
          viewService.buildComponent('hotMovie'),
        ],
      ),
    );
  }

  Widget _buildRecommend() {
    return SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Adapt.px(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    I18n.of(viewService.context).recommendations,
                    style: _selectPopStyle,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () => dispatch(
                        HomePageActionCreator.onMoreTapped(state.recommendMovie, MediaType.recommend)
                    ),
                    child: Text(I18n.of(viewService.context).more,
                        style: _unselectPopStyle),
                  ),
                ],
              ),
            ),
            viewService.buildComponent('recommendMovie'),
          ],
        )
    );
  }

  Widget _getStyle4() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 48, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 45, 48, 1),
        brightness: Brightness.dark,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: _buildSearchBar(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          viewService.buildComponent('swiper'),
//          SliverToBoxAdapter(
//            child: Container(
//              margin: EdgeInsets.only(top: Adapt.px(30)),
//              height: Adapt.px(150),
//              child: ListView(
//                scrollDirection: Axis.horizontal,
//                children: [1, 2, 3, 4, 4, 4, 4, 4].map((f) {
//                  return Padding(
//                      padding: EdgeInsets.only(left: Adapt.px(30)),
//                      child: Column(
//                        children: <Widget>[
//                          Container(
//                            width: Adapt.px(100),
//                            height: Adapt.px(100),
//                            decoration: BoxDecoration(
//                                color: Colors.grey[300],
//                                borderRadius:
//                                    BorderRadius.circular(Adapt.px(20))),
//                            child: Icon(Icons.directions_run),
//                          ),
//                          Container(
//                              alignment: Alignment.center,
//                              width: Adapt.px(100),
//                              child: Text('data'))
//                        ],
//                      ));
//                }).toList(),
//              ),
//            ),
//          ),
          _buildHotMovie(),//热门
          _buildRecommend(),//推荐
          _buildNewMovieHeader(),
          viewService.buildComponent('newmovie'),
        ],
      ),
    );
  }

  return _getStyle4();
}
