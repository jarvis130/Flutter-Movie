
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movie/views/detail/detail_router.dart';
import 'package:movie/views/favorites/favorites_router.dart';
import 'package:movie/views/order/order_router.dart';
import 'package:movie/views/search/search_router.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/setting/setting_router.dart';
import 'package:movie/views/user/user_router.dart';
import 'package:movie/widgets/web_scene.dart';
import 'package:movie/widgets/404.dart';

class Routes {

  static String home = "/home";
  static String webViewPage = "/webview";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("未找到目标页");
        return WidgetNotFound();
      });

//    router.define(home, handler: Handler(
//      handlerFunc: (BuildContext context, Map<String, List<String>> params) => Home()));
    
//    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
//      String title = params['title']?.first;
//      String url = params['url']?.first;
//      return WebViewPage(title: title, url: url);
//    }));


    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebScene(title: title, url: url);
    }));
    
    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
//    _listRouter.add(ShopRouter());
//    _listRouter.add(LoginRouter());
//    _listRouter.add(GoodsRouter());
    _listRouter.add(OrderRouter());
//    _listRouter.add(StoreRouter());
//    _listRouter.add(AccountRouter());
    _listRouter.add(SettingRouter());
//    _listRouter.add(StatisticsRouter());
    _listRouter.add(UserRouter());
    _listRouter.add(DetailRouter());
    _listRouter.add(FavoritesRouter());
    _listRouter.add(SearchRouter());
    /// 初始化路由
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });
  }
}
