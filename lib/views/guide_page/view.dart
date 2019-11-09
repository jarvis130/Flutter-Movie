import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flukit/flukit.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:movie/customwidgets/screen.dart';

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

  final pages = [
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
        // bubbleBackgroundColor: Colors.indigo,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text('陪你每一个夜晚'),
            // Text(
            //   'Plan your finance, anytime, anywhere.',
            //   style: TextStyle(
            //     color: Colors.black54,
            //     fontSize: 16.0
            //   ),
            // ),
          ],
        ),
        mainImage: Image.asset(
          'images/guide1.png',
          fit: BoxFit.cover,
          width: Screen.width,
          height: Screen.height,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
        iconColor: null,
        bubbleBackgroundColor: Colors.indigo,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text('同你去往每个地方'),
//            Text(
//              'Send money in just one touch and organize your wallet smart.',
//              style: TextStyle(
//                color: Colors.black54,
//                fontSize: 16.0
//              ),
//            ),
          ],
        ),
        mainImage: Image.asset(
          'images/guide2.png',
          fit: BoxFit.cover,
          width: Screen.width,
          height: Screen.height,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
        iconColor: null,
        bubbleBackgroundColor: Colors.indigo,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text('懂你，更懂你所爱'),
            Text(
              '因为在意，所以用心',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0
              ),
            ),
          ],
        ),
        mainImage: Image.asset(
          'images/guide3.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.black),
    ),
  ];

  return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: (){
                dispatch(GuideActionCreator.onGoMain());
              },
              showSkipButton: false,
              doneText: Text("立即启程",),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: new TextStyle(
                  // color: Colors.indigo,
                  fontSize: 16.0,
                  fontFamily: "Regular",
              ),
            ),
            // Positioned(
            //   top: 20.0,
            //   left: MediaQuery.of(viewService.context).size.width/2 - 50,
            //   child: Image.asset('assets/smwallet/logo.png', width: 100,)
            // )
          ],
        ),
      ),
    );

//   return Scaffold(
//       body: Swiper(
//           autoStart: false,
//           circular: false,
//           indicator: CircleSwiperIndicator(
//               radius: 2,
//               spacing: 4,
//               padding: EdgeInsets.only(bottom: 32.0),
//               itemColor: Colors.white,
// //              itemActiveColor: AppColor.primary
//           ),
//           children: [
//             _buildListCell(0),
//             _buildListCell(1),
//             _buildListCell(2),
//             _buildListCellLast()
//           ]
//       )
//   );
}
