import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/globalbasestate/state.dart';
import 'package:movie/views/classify_page/page.dart';
import 'package:movie/views/home_page/page.dart';
import 'package:movie/views/collect_page/page.dart';
import 'package:movie/views/user/user_page.dart';

class MainPageState implements GlobalBaseState<MainPageState> {
  int selectedIndex=0;
  List<Widget> pages=new List<Widget>()
  ..add(HomePage().buildPage(Map<String,String>()))
//  ..add(DiscoverPage().buildPage(Map<String,String>()))
  ..add(ClassifyPage().buildPage(Map<String,String>()))

//  ..add(DouyinPage().buildPage(Map<String,String>()))

  ..add(CollectPage().buildPage(Map<String,String>()))

//  ..add(AccountPage().buildPage(Map<String,String>()));
//  ..add(UserPage().buildPage(Map<String,String>()));
//  ..add(WebPage().buildPage(Map<String,String>()));
    ..add(UserPage());
  @override
  MainPageState clone() {
    return MainPageState();
  }

  @override
  Color themeColor;
}

MainPageState initState(Map<String, dynamic> args) {
  return MainPageState();
}
