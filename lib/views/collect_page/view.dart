import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/generated/i18n.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(CollectState state, Dispatch dispatch, ViewService viewService) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Container(
              child: TabBar(
            onTap: (i) {
              // if (i == 0)
                // dispatch(MyActionCreator.onFilterChanged(true));
              // else
                // dispatch(MyActionCreator.onFilterChanged(false));
            },
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle:
                TextStyle(fontSize: Adapt.px(35), fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            tabs: <Widget>[
              Tab(
                text: I18n.of(viewService.context).favorites,
              ),
              Tab(
                text: I18n.of(viewService.context).concern,
              )
            ],
          )),
          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
          elevation: 0.0,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            viewService.buildComponent('favorites'),
            // viewService.buildComponent('tvlist'),
            viewService.buildComponent('concerns'),
          ],
        )),
  );
}