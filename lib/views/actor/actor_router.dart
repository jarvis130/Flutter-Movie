
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/actor/actor_page.dart';
import 'package:movie/views/favorites/favorites_page.dart';


class ActorRouter implements IRouterProvider{

  static String actorPage = "/views/actor/actor_page";
  
  @override
  void initRouter(Router router) {
    router.define(actorPage, handler: Handler(handlerFunc: (_, params) => ActorPage(params)));

  }
  
}