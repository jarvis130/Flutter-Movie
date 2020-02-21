import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/models/GoodProducts.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/enums/media_type.dart';

class MoreMediaPageState implements Cloneable<MoreMediaPageState> {

MediaType mediaType;
List<Product> goodProducts;
int currentPage;
int total;
int size;
int pages;
ScrollController scrollController;
AnimationController animationController;

  @override
  MoreMediaPageState clone() {
    return MoreMediaPageState()
    ..goodProducts=goodProducts
    ..scrollController=scrollController
    ..mediaType=mediaType
    ..animationController=animationController
    ..total = total
    ..currentPage = currentPage
    ..size = size
    ..pages = pages;
  }
}

MoreMediaPageState initState(Map<String, dynamic> args) {
  MoreMediaPageState state=MoreMediaPageState();
  state.goodProducts=args['list']??new List<Product>();
  state.mediaType=args['type']??MediaType.movie;
  state.currentPage = 0;
  state.total = 0;
  state.size = 0;
  state.pages = 0;
  return state;
}
