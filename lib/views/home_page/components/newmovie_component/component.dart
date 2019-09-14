import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NewMovieComponent extends Component<NewMovieState> {
  NewMovieComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NewMovieState>(
                adapter: null,
                slots: <String, Dependent<NewMovieState>>{
                }),);

}
