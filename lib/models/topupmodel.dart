import 'dart:convert' show json;

import 'package:fish_redux/fish_redux.dart';

class TopupGoodsListModel {

  List< TopupGoodsListResult> results;

  TopupGoodsListModel.fromParams({this.results});

  factory TopupGoodsListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new TopupGoodsListModel.fromJson(json.decode(jsonStr)) : new TopupGoodsListModel.fromJson(jsonStr);

  TopupGoodsListModel.fromJson(jsonRes) {

    results = jsonRes['data']['info'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
            results.add(resultsItem == null ? null : new TopupGoodsListResult.fromJson(resultsItem));
    }

  }

}

class TopupGoodsListResult {

  String id;
  String name;
  String amount;
  String client;



  TopupGoodsListResult.fromParams({
    this.id,
    this.name,
    this.amount,
    this.client,

  });

  TopupGoodsListResult.fromJson(jsonRes) {
    this.id = jsonRes['id'];
    this.name = jsonRes['name'];
    this.amount = jsonRes['amount'];
    this.client = jsonRes['client'];

  }

}

class PaymentMethodListModel {

  List<PaymentMethodListResult> results;

  PaymentMethodListModel.fromParams({this.results});

  factory PaymentMethodListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new PaymentMethodListModel.fromJson(json.decode(jsonStr)) : new PaymentMethodListModel.fromJson(jsonStr);

  PaymentMethodListModel.fromJson(jsonRes) {

    results = jsonRes['data']['info'] == null ? null : [];

    for (var resultsItem in results == null ? [] : jsonRes['data']['info']){
      results.add(resultsItem == null ? null : new PaymentMethodListResult.fromJson(resultsItem));
    }

  }

}

class PaymentMethodListResult {

  String id;
  String name;


  PaymentMethodListResult.fromParams({
    this.id,
    this.name,

  });

  PaymentMethodListResult.fromJson(jsonRes) {
    this.id = jsonRes['id'];
    this.name = jsonRes['name'];

  }

}

class TopupModel {

//  TopupModel.fromParams({this.results});
  int code;
  String msg;

  factory TopupModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new TopupModel.fromJson(json.decode(jsonStr)) : new TopupModel.fromJson(jsonStr);

  TopupModel.fromJson(jsonRes) {

    code = jsonRes['data']['code'] == null ? 0 : jsonRes['data']['code'];
    msg = jsonRes['data']['msg'] == null ? 0 : jsonRes['data']['msg'];
  }

}