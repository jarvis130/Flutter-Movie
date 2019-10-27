import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/apihelper.dart';
import 'package:movie/customwidgets/web_scene.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(WebPageState state, Dispatch dispatch, ViewService viewService) {

  String url = ApiHelper.shopUrl+'?username=${state.username}';
  return WebScene(url: url, title: '商城');
}
