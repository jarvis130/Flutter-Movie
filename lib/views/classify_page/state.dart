import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/ProductModel.dart';

class ClassifyPageState implements Cloneable<ClassifyPageState> {

  List<Product> productList;
  ScrollController scrollController;
  AnimationController animationController;
  AnimationController cellAnimationController;
  bool isPerformingRequest;
  int currentPage;
  int total;
  int size;
  int pages;
  //属性查询状态
  List atrributionList1;
  List atrributionList2;
  List atrributionList3;
  int groupValue1;
  int groupValue2;
  int groupValue3;
  String groupTitle1;
  String groupTitle2;
  String groupTitle3;

  @override
  ClassifyPageState clone() {
    return ClassifyPageState()
    ..productList = productList
    ..scrollController = scrollController
    ..animationController=animationController
    ..cellAnimationController=cellAnimationController

    ..isPerformingRequest = isPerformingRequest

    ..atrributionList1 = atrributionList1
    ..atrributionList2 = atrributionList2
    ..atrributionList3 = atrributionList3
    ..groupValue1 = groupValue1
    ..groupValue2 = groupValue2
    ..groupValue3 = groupValue3
    ..groupTitle1 = groupTitle1
    ..groupTitle2 = groupTitle2
    ..groupTitle3 = groupTitle3

    ..total = total
    ..currentPage = currentPage
    ..size = size
    ..pages = pages;
  }
}

ClassifyPageState initState(Map<String, dynamic> args) {
  var state = ClassifyPageState();
  state.productList = new List<Product>();
  state.isPerformingRequest = false;
  state.atrributionList1 = [];
  state.atrributionList2 = [];
  state.atrributionList3 = [];
  state.groupValue1 = 0;
  state.groupValue2 = 0;
  state.groupValue3 = 0;
  state.groupTitle1 = '';
  state.groupTitle2 = '';
  state.groupTitle3 = '';
  state.currentPage = 0;
  state.total = 0;
  state.size = 0;
  state.pages = 0;
  return state;
}
