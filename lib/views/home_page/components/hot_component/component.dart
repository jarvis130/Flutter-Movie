import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HotMovieComponent extends Component<HotMovieState> {
  HotMovieComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HotMovieState>(
                adapter: null,
                slots: <String, Dependent<HotMovieState>>{
                }),);

}
