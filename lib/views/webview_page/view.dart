import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/web_scene.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(WebPageState state, Dispatch dispatch, ViewService viewService) {

//  String url = ApiHelper.shopUrl+'?username=${state.username}';
//  return WebScene(url: url, title: '商城');


  String url = 'http://221.229.197.4:8085/#/topup'+'?uid=${state.uid}&token=${state.token}&client=${state.client}';
  return WebScene(url: url, title: '充值');
}
