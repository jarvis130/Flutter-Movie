import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/models/CommentModel.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(ReviewState state, Dispatch dispatch, ViewService viewService) {

  CommentModel model = state.reviewModel;

  return new Scaffold(
//    appBar: _appBar(),
    body: Container(
        child: Builder(builder: (BuildContext context) {
          return CustomScrollView(
            controller: state.scrollController,
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext contxt, int index) {
                      var d = model.reviews[index];
                      return GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              Adapt.px(30), 0, Adapt.px(30), Adapt.px(30)),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(Adapt.px(30)),
                              height: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: Adapt.px(100),
                                        height: Adapt.px(100),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Adapt.px(50)),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: CachedNetworkImageProvider(
                                                    d.toString()
                                                )
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: Adapt.px(10),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            d.username,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Adapt.px(30),
                                                fontWeight: FontWeight.w700),
                                          )
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          d.updatedAt.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Adapt.px(30),
                                              fontWeight: FontWeight.w700),
                                        )
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Adapt.px(20),
                                  ),
                                  new Expanded(
                                    child: new LayoutBuilder(builder:
                                        (BuildContext context,
                                        BoxConstraints constraints) {
                                      print(constraints);
                                      return new Text(
                                        d.content,
                                        overflow: TextOverflow.fade,
                                        maxLines: (constraints.maxHeight /
                                            Theme.of(context)
                                                .textTheme
                                                .body1
                                                .fontSize)
                                            .floor(),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
      //                    var url = state.reviewModel.commentlist[index].url;
      //                    if (await canLaunch(url)) {
      //                      await launch(url);
      //                    }

                        },
                      );
                    }, childCount: model.reviews.length),
                  ),
                  SliverToBoxAdapter(
                    child: Offstage(
                      offstage: state.reviewModel.reviews.length == state.total,
                      child: Container(
                        height: Adapt.px(120),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                        ),
                      ),
                    ),
                  )
                ]
              );
        }
      )
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
