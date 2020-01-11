import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/models/CommentModel.dart';
import 'package:shimmer/shimmer.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(ReviewState state, Dispatch dispatch, ViewService viewService) {

  CommentModel model = state.reviewModel;

  final TextStyle _textStyle = TextStyle(fontSize: 12.0);

  final String _author = '李白。';

  final String _title = '将进酒';

  @override

  Widget _text(content) {

    // TODO: implement build

    return Text(

      '' + content,

      textAlign: TextAlign.left, //文字对齐方式

      style: _textStyle,//样式

      maxLines: 3,//显示的行数

      overflow: TextOverflow.ellipsis,//溢出部分省略号

    );

  }

  Widget _buildCell(Reviews comment) {
    return Card(
      elevation: 5.0,  //设置阴影
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),  //设置圆角
      child: new Column(  // card只能有一个widget，但这个widget内容可以包含其他的widget
        children: [
          new ListTile(
            title: Text(
                comment.username,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Adapt.px(26)
                )
            ),
            trailing: Text(
                comment.updatedAt.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Adapt.px(22)
                )
            ),
            leading: ClipOval(
              child: CircleAvatar(
                  backgroundImage: comment.avatar_url == null ? AssetImage('images/empty.png') : CachedNetworkImageProvider(
                      comment.avatar_url
                  )
              ),
            ),
          ),
//          new Divider(),
          Container(
            padding: EdgeInsets.fromLTRB(Adapt.px(10), Adapt.px(5), Adapt.px(10), Adapt.px(5)),
            child: _text(comment.content),
          )
        ],
      ),
    );
  }

  Widget _buildShimmerCell() {
    return Card(
      elevation: 5.0,  //设置阴影
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),  //设置圆角
      child: new Column(  // card只能有一个widget，但这个widget内容可以包含其他的widget
        children: [
          new ListTile(
            title: Container(
              width: Adapt.px(50),
              height: Adapt.px(30),
              color: Colors.grey[200],
            ),
            trailing: Container(
              width: Adapt.px(100),
              height: Adapt.px(30),
              color: Colors.grey[200],
            ),
            leading: ClipOval(
              child: CircleAvatar(backgroundImage: AssetImage('images/empty.png')),
            ),
          ),
//          new Divider(),
          Container(
            padding: EdgeInsets.fromLTRB(Adapt.px(10), Adapt.px(5), Adapt.px(10), Adapt.px(5)),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(Adapt.px(5), Adapt.px(5), Adapt.px(5), Adapt.px(15)),
                  width: Adapt.screenW(),
                  height: Adapt.px(30),
                  color: Colors.grey[200],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(Adapt.px(5), Adapt.px(5), Adapt.px(5), Adapt.px(15)),
                  width: Adapt.screenW(),
                  height: Adapt.px(30),
                  color: Colors.grey[200],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(Adapt.px(5), Adapt.px(5), Adapt.px(5), Adapt.px(15)),
                  width: Adapt.screenW(),
                  height: Adapt.px(30),
                  color: Colors.grey[200],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView(
      children: <Widget>[
        _buildShimmerCell(),
        _buildShimmerCell(),
        _buildShimmerCell(),
        _buildShimmerCell(),
      ],
    );
  }

  Widget _build() {
    return CustomScrollView(
      controller: state.scrollController,
      slivers: <Widget>[
        SliverFixedExtentList(
          itemExtent: 130.0,
          delegate: SliverChildListDelegate(
            model.reviews.map((comment) {
              return _buildCell(comment);
            }).toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Offstage(
            offstage: model.reviews.length == state.total,
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
    );
  }

  return new Scaffold(
//    appBar: _appBar(),
    body: Container(
        padding: EdgeInsets.fromLTRB(Adapt.px(10), Adapt.px(200), Adapt.px(10), Adapt.px(10)),
        child: model.reviews != null ? _build() : _buildShimmer(),

    ),
    floatingActionButton: new FloatingActionButton(
      backgroundColor: Colors.red,
      elevation: 10.0,
      tooltip: '添加评论', // used by assistive technologies
      child: new Icon(Icons.edit),
      mini: true,
      onPressed: () {
        dispatch(ReviewActionCreator.onOpenReview(state.movieid));
      }
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//    drawer: _drawer(context),
//    endDrawer: Drawer(child: Text("右抽屉")),
//    bottomNavigationBar: _BottomNavigationBar(),
  );

}
