import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/UserDetailModel.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/enums/list_sort_type.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';
import 'package:screenshot/screenshot.dart';

class ListDetailPageState implements Cloneable<ListDetailPageState> {

 int userid;
 UserModel userDetailModel;
 GoodProducts videoList;
 ScrollController scrollController;
 List<SortCondition> sortBy;
 String sortType;
 int currentPage;
 int total;
 int size;
 int pages;

  @override
  ListDetailPageState clone() {
    return ListDetailPageState()
    ..userDetailModel=userDetailModel
    ..videoList=videoList
    ..userid=userid
    ..sortBy=sortBy
    ..sortType=sortType
    ..scrollController=scrollController
    ..total = total
    ..currentPage = currentPage
    ..size = size
    ..pages = pages;
  }
}

ListDetailPageState initState(Map<String, dynamic> args) {
  ListDetailPageState state=ListDetailPageState();
  state.userid = int.parse(args['userid']);
  state.sortBy=<SortCondition>[
    SortCondition(isSelected: true,name: 'Original Order',value: ListSortType.originalOrderAsc),
    SortCondition(isSelected: false,name: 'Rating',value: ListSortType.voteAverageDesc),
    SortCondition(isSelected: false,name: 'Release Date',value: ListSortType.releaseDateDesc),
    SortCondition(isSelected: false,name: 'Title',value: ListSortType.titleAsc),
  ];
  state.sortType=ListSortType.originalOrderAsc;
  state.userDetailModel=new UserModel();
  state.videoList=new GoodProducts();
  state.currentPage = 0;
  state.total = 0;
  state.size = 0;
  state.pages = 0;
  return state;
}
