
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/setting/avatar_page.dart';

import 'about_page.dart';
import 'account_manager_page.dart';
import 'setting_page.dart';

class SettingRouter implements IRouterProvider{

  static String settingPage = "/views/setting";
  static String aboutPage = "/views//setting/about";
  static String accountManagerPage = "/views/setting/accountManager";
  static String avatarPage = "/views/setting/avatar_page";

  @override
  void initRouter(Router router) {
    router.define(settingPage, handler: Handler(handlerFunc: (_, params) => SettingPage()));
    router.define(aboutPage, handler: Handler(handlerFunc: (_, params) => About()));
    router.define(accountManagerPage, handler: Handler(handlerFunc: (_, params) => AccountManagerPage()));
    router.define(avatarPage, handler: Handler(handlerFunc: (_, params) => AvatarPage()));
  }

}