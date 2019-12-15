import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/actions/Adapt.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/HomeModel.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/searchresult.dart';
import 'package:movie/models/swiperlist.dart';
import 'package:movie/models/videolist.dart';

class HomePageState implements Cloneable<HomePageState> {
  BannerModel swiper;
  List<Products> hotModel;
  List<Products> newModel;
  List<Products> recommendModel;

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

  state.hotModel = List<Products>();
  state.newModel = List<Products>();
  state.recommendModel = List<Products>();

  return state;
}
