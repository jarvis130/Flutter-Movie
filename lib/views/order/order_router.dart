
import 'package:fluro/fluro.dart';
import 'package:movie/routers/router_init.dart';
import 'order_record_list_page.dart';


class OrderRouter implements IRouterProvider{

  static String orderRecordListPage = "/views/order/order_record_list_page";
  
  @override
  void initRouter(Router router) {
    router.define(orderRecordListPage, handler: Handler(handlerFunc: (_, params) => OrderRecordListPage()));

  }
  
}