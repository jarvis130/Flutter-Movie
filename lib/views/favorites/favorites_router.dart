
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/favorites/favorites_page.dart';


class FavoritesRouter implements IRouterProvider{

  static String favoritesPage = "/views/favorites/favorites_page";
  
  @override
  void initRouter(Router router) {
    router.define(favoritesPage, handler: Handler(handlerFunc: (_, params) => FavoritesPage()));

  }
  
}