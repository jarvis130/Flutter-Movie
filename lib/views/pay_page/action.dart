import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/topupmodel.dart';

//TODO replace with your own action
enum PayAction {
  action,
  onSetGoodsValue,
  setGoodsValue,
  submit,
  topupGoodsList,
  paymentMethodList,
  onSetStep,
  setStep,
  topup,
  onSetPaymentValue,
  setPaymentValue,
}

class PayActionCreator {
  static Action onAction() {
    return const Action(PayAction.action);
  }
  static Action onSetGoodsValue(String v) {
    return Action(PayAction.onSetGoodsValue, payload: v);
  }
  static Action setGoodsValue(String v) {
    return Action(PayAction.setGoodsValue, payload: v);
  }
  static Action onSetPaymentValue(String v) {
    return Action(PayAction.onSetPaymentValue, payload: v);
  }
  static Action setPaymentValue(String v) {
    return Action(PayAction.setPaymentValue, payload: v);
  }
  static Action onSubmit() {
    return Action(PayAction.submit);
  }
  static Action topupGoodsList(TopupGoodsListModel m) {
    return Action(PayAction.topupGoodsList, payload: m);
  }
  static Action paymentMethodList(PaymentMethodListModel m) {
    return Action(PayAction.paymentMethodList, payload: m);
  }
  static Action onSetSetp(int v) {
    return Action(PayAction.paymentMethodList, payload: v);
  }
  static Action setStep(int v) {
    return Action(PayAction.setStep, payload: v);
  }
  static Action onSumitTopup() {
    return Action(PayAction.topup);
  }
}
