import 'package:fish_redux/fish_redux.dart';
import 'package:movie/widgets/custom_stfstate.dart';
import 'package:movie/views/home_page/components/hot_component/component.dart';
import 'package:movie/views/home_page/components/hot_component/state.dart';
// import 'package:movie/views/home_page/components/movie_component/component.dart';
// import 'package:movie/views/home_page/components/popular_cpmponent/component.dart';
import 'package:movie/views/home_page/components/searchbar_component/component.dart';
import 'package:movie/views/home_page/components/swiper_component/component.dart';
import 'package:movie/views/home_page/components/newmovie_component/component.dart';

import 'components/newmovie_component/state.dart';
import 'components/swiper_component/state.dart';
// import 'components/movie_component/state.dart';
// import 'components/popular_cpmponent/state.dart';
// import 'components/popularposter_cpmponent/component.dart';
// import 'components/popularposter_cpmponent/state.dart';
import 'components/searchbar_component/state.dart';
// import 'components/tv_component/component.dart';
// import 'components/tv_component/state.dart';
import 'components/recommend_component/component.dart';
import 'components/recommend_component/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomePageState, Map<String, dynamic>> {
  @override
  CustomstfState<HomePageState> createState() =>
      CustomstfState<HomePageState>();
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomePageState>(
              adapter: null,
              slots: <String, Dependent<HomePageState>>{
                'searchbar': SearchBarConnector() + SearchBarComponent(),
                'swiper': SwiperConnector() + SwiperComponent(),
                'hotMovie': HotMovieConnector() + HotMovieComponent(),
                'recommendMovie': RecommendMovieConnector() + RecommendMovieComponent(),
//                'moviecells': MovieCellsConnector() + MovieCellsComponent(),
//                'tvcells': TVCellsConnector() + TVCellsComponent(),
                // 'popular': PopularConnector() + PopularComponent(),
                'newmovie': NewMovieConnector() + NewMovieComponent(),
//                'popularposter':
//                    PopularPosterConnector() + PopularPosterComponent()
              }),
          middleware: <Middleware<HomePageState>>[],
        );
}
