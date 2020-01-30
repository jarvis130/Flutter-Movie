
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/api/order_api.dart';
import 'package:movie/routers/fluro_navigator.dart';
import 'package:movie/utils/toast.dart';
import 'package:movie/widgets/base_dialog.dart';
import 'package:movie/style/styles.dart';


class OrderConfirmDialog extends StatefulWidget{

  OrderConfirmDialog({
    Key key,
  }) : super(key : key);

  @override
  _OrderConfirmDialog createState() => _OrderConfirmDialog();
  
}

class _OrderConfirmDialog extends State<OrderConfirmDialog>{

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "提示",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text("您確定要開通賬戶嗎？", style: TextStyles.textDark16),
      ),
      onPressed: (){
        _orderConfirm();
      },
    );
  }

  void _orderConfirm() async{
    Map map = await OrderApi.orderConfirm(
        shop: 1,
        consignee: 1,
        cart_good_id: jsonEncode([1])
    );
    if(map != null){
      if(map['error_code'] == 400){
        Toast.show(map['error_desc']);
      }else{
        NavigatorUtils.goBack(context);
        Toast.show("绑定成功");
      }
    }

  }
}