import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/topupmodel.dart';
import 'package:flutter/material.dart';

class PayState implements Cloneable<PayState> {

  GlobalKey<ScaffoldState> scaffoldkey;
  String goodsVal;
  String paymentVal;
  TopupGoodsListModel topupGoodsListModel;
  PaymentMethodListModel paymentMethodListModel;
  int step;

  @override
  PayState clone() {
    return PayState()
    ..topupGoodsListModel = topupGoodsListModel
    ..paymentMethodListModel = paymentMethodListModel
    ..step = step
    ..paymentVal = paymentVal
    ..goodsVal = goodsVal;
  }
}

PayState initState(Map<String, dynamic> args) {
  PayState state = new PayState();
  state.step = 1;
  state.goodsVal = '1';
  state.paymentVal = '1';
  return state;
}
