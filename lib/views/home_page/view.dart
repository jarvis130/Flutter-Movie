
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/generated/i18n.dart';
import 'package:movie/globalconfig.dart';
import 'package:movie/models/enums/media_type.dart';
import 'package:shimmer/shimmer.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomePageState state, Dispatch dispatch, ViewService viewService) {

  TextStyle _selectPopStyle = TextStyle(
      fontSize: Adapt.px(GlobalConfig.FONTSIZE_TITLE), fontWeight: FontWeight.bold, color: Colors.white);

  TextStyle _unselectPopStyle =
      TextStyle(fontSize: Adapt.px(GlobalConfig.FONTSIZE_SUBTITLE), color: Colors.grey);

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
                style: TextStyle(color: Colors.grey, fontSize: Adapt.px(GlobalConfig.FONTSIZE_NAVIGATION)),
              )
            ],
          )),
    );
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
                        HomePageActionCreator.onMoreTapped(state.newModel, MediaType.newMovie)
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
                      HomePageActionCreator.onMoreTapped(state.hotModel, MediaType.hot)
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
                        HomePageActionCreator.onMoreTapped(state.recommendModel, MediaType.recommend)
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

  Future < void > _onRefresh() async {

    dispatch(HomePageActionCreator.onRefresh());

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
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          slivers: <Widget>[
            viewService.buildComponent('swiper'),
            _buildHotMovie(),//热门
            _buildRecommend(),//推荐
            _buildNewMovieHeader(),
            viewService.buildComponent('newmovie'),
          ],
        ),
      )


    );
  }

  return _getStyle4();
}
