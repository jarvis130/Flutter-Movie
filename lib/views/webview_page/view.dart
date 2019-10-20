import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/customwidgets/web_scene.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WebPageState state, Dispatch dispatch, ViewService viewService) {
  return WebScene(url: 'https://www.jd.com', title: '商城');
}
