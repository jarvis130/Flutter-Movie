import 'package:fish_redux/fish_redux.dart';
import 'package:movie/models/enums/media_type.dart';
import 'package:movie/models/moviechange.dart';
import 'package:movie/models/movielist.dart';
import 'package:movie/models/searchresult.dart';
import 'package:movie/models/swiperlist.dart';
import 'package:movie/models/videolist.dart';

//TODO replace with your own action
enum HomePageAction {
  action,
  initSwiper,
  initHot,
  initRecommend,
  initNew,
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
}

class HomePageActionCreator {
  static Action onAction() {
    return const Action(HomePageAction.action);
  }

  static Action onInitSwiper(SwiperListModel swiper) {
    return Action(HomePageAction.initSwiper, payload: swiper);
  }

  static Action onInitHot(MovieListModel hot) {
    return Action(HomePageAction.initHot, payload: hot);
  }

  static Action onInitRecommend(MovieListModel hot) {
    return Action(HomePageAction.initRecommend, payload: hot);
  }

  static Action onInitNew(MovieListModel hot) {
    return Action(HomePageAction.initNew, payload: hot);
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

  static Action onMoreTapped(VideoListModel model, MediaType t) {
    return Action(HomePageAction.moreTapped, payload: [model, t]);
  }

  static Action initTrending(SearchResultModel d) {
    return Action(HomePageAction.initTrending, payload: d);
  }

  static Action onSearchBarTapped() {
    return const Action(HomePageAction.searchBarTapped);
  }

  static Action onCellTapped(
      int id, String bgpic, String title, String posterpic, MediaType type) {
    return Action(HomePageAction.cellTapped,
        payload: [id, bgpic, title, posterpic, type]);
  }
}
