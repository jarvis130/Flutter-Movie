import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/searchresult.dart';

class HomePageState implements Cloneable<HomePageState> {
  BannerModel swiper;
  List<Product> hotModel;
  List<Product> newModel;
  List<Product> recommendModel;

  SearchResultModel trending;
  ScrollController scrollController;
  AnimationController animatedController;

  @override
  HomePageState clone() {
    return HomePageState()
      ..swiper = swiper
      ..hotModel = hotModel
      ..newModel = newModel
      ..recommendModel = recommendModel
      ..trending = trending
      ..scrollController = scrollController
      ..animatedController = animatedController;
  }
}

HomePageState initState(Map<String, dynamic> args) {
  var state = HomePageState();

  state.swiper = new BannerModel();

  state.hotModel = List<Product>();
  state.newModel = List<Product>();
  state.recommendModel = List<Product>();

  return state;
}
