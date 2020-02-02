
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'package:movie/views/user/user_page.dart';


class UserRouter implements IRouterProvider{

  static String userPage = "/views/user/user_page";
  
  @override
  void initRouter(Router router) {
    router.define(userPage, handler: Handler(handlerFunc: (_, params) => UserPage()));

  }
  
}