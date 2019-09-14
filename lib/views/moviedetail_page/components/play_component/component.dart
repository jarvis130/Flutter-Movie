import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayComponent extends Component<PlayState> {
  PlayComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayState>(
                adapter: null,
                slots: <String, Dependent<PlayState>>{
                }),);

}
