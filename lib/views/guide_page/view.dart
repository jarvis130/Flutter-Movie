import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flukit/flukit.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(GuideState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildListCell(int i) {
    return Stack(
      children: <Widget>[
        new Image.asset(
          state.guideList[i],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        new Center(
          child: new Text(
            state.guideInfoList[i],
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildListCellLast() {
    return Stack(
      children: <Widget>[
        Image.asset(
          state.guideList[3],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: new Text(
            state.guideInfoList[3],
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: new Container(
            margin: EdgeInsets.only(bottom: 50.0),
            child: new GestureDetector(
              onTap: () {
                dispatch(GuideActionCreator.onGoMain());
              },
              child: new Container(
                width: 185,
                alignment: Alignment.center,
                height: 48,
                child: new Text(
                  '立即启程',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    color: Color(0X19FFFFFF),
                    border:
                    new Border.all(width: 1, color: Colors.white70)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  return Scaffold(
      body: Swiper(
          autoStart: false,
          circular: false,
          indicator: CircleSwiperIndicator(
              radius: 2,
              spacing: 4,
              padding: EdgeInsets.only(bottom: 32.0),
              itemColor: Colors.white,
//              itemActiveColor: AppColor.primary
          ),
          children: [
            _buildListCell(0),
            _buildListCell(1),
            _buildListCell(2),
            _buildListCellLast()
          ]
      )
  );
}
