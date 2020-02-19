
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/search/search_page.dart';


class SearchRouter implements IRouterProvider{

  static String searchPage = "/views/search/search_page";
  
  @override
  void initRouter(Router router) {
    router.define(searchPage, handler: Handler(handlerFunc: (_, params) => SearchPage()));
  }
  
}