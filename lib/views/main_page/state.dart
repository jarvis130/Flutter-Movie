import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/globalbasestate/state.dart';
import 'package:movie/views/account_page/page.dart';
import 'package:movie/views/classify_page/page.dart';
import 'package:movie/views/coming_page/page.dart';
import 'package:movie/views/discover_page/page.dart';
import 'package:movie/views/douyin_page/page.dart';
import 'package:movie/views/home_page/page.dart';
import 'package:movie/views/login_page/page.dart';
import 'package:movie/views/my_page/page.dart';
import 'package:movie/views/user_page/page.dart';
import 'package:movie/views/webview_page/page.dart';

class MainPageState implements GlobalBaseState<MainPageState> {
  int selectedIndex=0;
  List<Widget> pages=new List<Widget>()
  ..add(HomePage().buildPage(Map<String,String>()))
//  ..add(DiscoverPage().buildPage(Map<String,String>()))
  ..add(ClassifyPage().buildPage(Map<String,String>()))

  ..add(DouyinPage().buildPage(Map<String,String>()))

  ..add(MyPage().buildPage(Map<String,String>()))

//  ..add(AccountPage().buildPage(Map<String,String>()));
  ..add(UserPage().buildPage(Map<String,String>()));
//  ..add(WebPage().buildPage(Map<String,String>()));
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
