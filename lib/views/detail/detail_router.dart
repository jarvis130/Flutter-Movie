
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/detail/detail_page.dart';


class DetailRouter implements IRouterProvider{

  static String detailPage = "/views/detail/detail_page";
  
  @override
  void initRouter(Router router) {
    router.define(detailPage, handler: Handler(handlerFunc: (_, params) => DetailPage(params)));

  }
  
}