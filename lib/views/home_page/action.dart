import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/BannerModel.dart';
import 'package:movie/models/ProductModel.dart';
import 'package:movie/models/enums/media_type.dart';
import 'package:movie/models/searchresult.dart';
import 'package:movie/models/videolist.dart';

//TODO replace with your own action
enum HomePageAction {
  action,
  initSwiper,
  initHot,
  initNew,
  initRecommend,
  initMovie,
  initTV,
  initPopularMovies,
  initPopularTVShows,
  popularFilterChanged,
  headerFilterChanged,
  moreTapped,
  initTrending,
  searchBarTapped,
  cellTapped,
  onRefresh
}

class HomePageActionCreator {
  static Action onAction() {
    return const Action(HomePageAction.action);
  }

  static Action onInitSwiper(BannerModel swiper) {
    return Action(HomePageAction.initSwiper, payload: swiper);
  }

  static Action onInitHot(List<Product> hot) {
    return Action(HomePageAction.initHot, payload: hot);
  }

  static Action onInitNew(List<Product> list) {
    return Action(HomePageAction.initNew, payload: list);
  }

  static Action onInitRecommend(List<Product> list) {
    return Action(HomePageAction.initRecommend, payload: list);
  }

  static Action onInitMovie(VideoListModel movie) {
    return Action(HomePageAction.initMovie, payload: movie);
  }

  static Action onInitTV(VideoListModel tv) {
    return Action(HomePageAction.initTV, payload: tv);
  }

  static Action onInitPopularMovie(VideoListModel pop) {
    return Action(HomePageAction.initPopularMovies, payload: pop);
  }

  static Action onInitPopularTV(VideoListModel pop) {
    return Action(HomePageAction.initPopularTVShows, payload: pop);
  }

  static Action onPopularFilterChanged(bool e) {
    return Action(HomePageAction.popularFilterChanged, payload: e);
  }

  static Action onHeaderFilterChanged(bool e) {
    return Action(HomePageAction.headerFilterChanged, payload: e);
  }

  static Action onMoreTapped(List<Product> model, MediaType t) {
    return Action(HomePageAction.moreTapped, payload: [model, t]);
  }

  static Action initTrending(SearchResultModel d) {
    return Action(HomePageAction.initTrending, payload: d);
  }

  static Action onSearchBarTapped() {
    return const Action(HomePageAction.searchBarTapped);
  }

  static Action onCellTapped(
      String id, String bgpic, String title, String posterpic, MediaType type) {
    return Action(HomePageAction.cellTapped,
        payload: [id, bgpic, title, posterpic, type]);
  }

  static Action onRefresh() {
    return const Action(HomePageAction.onRefresh);
  }
}
