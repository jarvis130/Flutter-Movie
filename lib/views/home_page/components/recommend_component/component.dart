import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecommendMovieComponent extends Component<RecommendMovieState> {
  RecommendMovieComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecommendMovieState>(
                adapter: null,
                slots: <String, Dependent<RecommendMovieState>>{
                }),);

}
