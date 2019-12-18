import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/UserModel.dart';
import 'package:movie/models/enums/list_sort_type.dart';
import 'package:movie/models/listdetailmodel.dart';
import 'package:movie/models/sortcondition.dart';
import 'package:screenshot/screenshot.dart';

class UserPageState implements Cloneable<UserPageState> {

  String userid;
  UserModel userModel;
  ScrollController scrollController;
  List<SortCondition> sortBy;
  String sortType;

  @override
  UserPageState clone() {
    return UserPageState()
      ..userModel=userModel
      ..userid=userid
      ..sortBy=sortBy
      ..sortType=sortType
      ..scrollController=scrollController;
  }
}

UserPageState initState(Map<String, dynamic> args) {
  UserPageState state=UserPageState();
  state.userid=args['userid'];
  state.sortBy=<SortCondition>[
    SortCondition(isSelected: true,name: 'Original Order',value: ListSortType.originalOrderAsc),
    SortCondition(isSelected: false,name: 'Rating',value: ListSortType.voteAverageDesc),
    SortCondition(isSelected: false,name: 'Release Date',value: ListSortType.releaseDateDesc),
    SortCondition(isSelected: false,name: 'Title',value: ListSortType.titleAsc),
  ];
  state.sortType = ListSortType.originalOrderAsc;
  state.userModel= new UserModel();
  return state;
}
