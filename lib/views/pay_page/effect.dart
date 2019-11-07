import 'package:fish_redux/fish_redux.dart';
import 'package:movie/api/pay_api.dart';
import 'package:movie/models/topupmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<PayState> buildEffect() {
  return combineEffects(<Object, Effect<PayState>>{
    PayAction.action: _onAction,
    PayAction.onSetGoodsValue: _onSetGoodsValue,
    PayAction.onSetPaymentValue: _onSetPaymentValue,
    PayAction.submit: _onSubmit,
    PayAction.onSetStep: _onSetStep,
    Lifecycle.initState: _onInit,
    PayAction.topup: _topup,
  });
}

void _onAction(Action action, Context<PayState> ctx) {
}

void _onInit(Action action, Context<PayState> ctx) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String client = prefs.getString('client') == null ? '1' : prefs.getString('client');
  String uid = prefs.getString('uid');
  TopupGoodsListModel model = await PayApi.getTopupGoodsList(client, uid);
  if (model != null) {
    ctx.dispatch(PayActionCreator.topupGoodsList(model));
  }
  ctx.dispatch(PayActionCreator.setStep(1));
}

void _onSetGoodsValue(Action action, Context<PayState> ctx) {
  ctx.dispatch(PayActionCreator.setGoodsValue(action.payload));
}

void _onSetPaymentValue(Action action, Context<PayState> ctx) {
  ctx.dispatch(PayActionCreator.setPaymentValue(action.payload));
}

void _onSetStep(Action action, Context<PayState> ctx) {
  ctx.dispatch(PayActionCreator.setStep(action.payload));
}

void _onSubmit(Action action, Context<PayState> ctx) async{
  String val = ctx.state.goodsVal;
  if (val == '' || val == null) {
    ctx.state.scaffoldkey.currentState.showSnackBar(SnackBar(
      content: Text('请选择充值商品'),
    ));
    return ;
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String uid = prefs.getString('uid');
  PaymentMethodListModel model = await PayApi.getPaymentMethodList(uid, val);
  if (model != null) {
    ctx.dispatch(PayActionCreator.paymentMethodList(model));
    ctx.dispatch(PayActionCreator.setStep(2));
  }
}

void _topup(Action action, Context<PayState> ctx) async{
  String goodsVal = ctx.state.goodsVal;
  String paymentVal = ctx.state.paymentVal;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String uid = prefs.getString('uid');
  String token = prefs.getString('accessTokenV4');
  TopupModel model = await PayApi.topup(uid, token, goodsVal, paymentVal);
  if (model != null) {
    if (model.code != 0){

    }else{
      Navigator.of(ctx.context).pop();
    }
  }
}

