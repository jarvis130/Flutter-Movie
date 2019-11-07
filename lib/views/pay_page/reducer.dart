import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PayState> buildReducer() {
  return asReducer(
    <Object, Reducer<PayState>>{
      PayAction.action: _onAction,
      PayAction.setGoodsValue: _setGoodsValue,
      PayAction.setPaymentValue: _setPaymentValue,
      PayAction.topupGoodsList: _setTopupGoodsList,
      PayAction.paymentMethodList: _setPaymentMethodList,
      PayAction.setStep: _setStep,
    },
  );
}

PayState _onAction(PayState state, Action action) {
  final PayState newState = state.clone();
  return newState;
}

PayState _setGoodsValue(PayState state, Action action) {
  final PayState newState = state.clone();
  newState.goodsVal = action.payload;
  return newState;
}

PayState _setPaymentValue(PayState state, Action action) {
  final PayState newState = state.clone();
  newState.paymentVal = action.payload;
  return newState;
}

PayState _setStep(PayState state, Action action) {
  final PayState newState = state.clone();
  newState.step = action.payload;
  return newState;
}

PayState _setTopupGoodsList(PayState state, Action action) {
  final PayState newState = state.clone();
  newState.topupGoodsListModel = action.payload;
  return newState;
}

PayState _setPaymentMethodList(PayState state, Action action) {
  final PayState newState = state.clone();
  newState.paymentMethodListModel = action.payload;
  return newState;
}