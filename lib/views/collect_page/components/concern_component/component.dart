import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ConcernComponent extends Component<ConcernState> {
  ConcernComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ConcernState>(
                adapter: null,
                slots: <String, Dependent<ConcernState>>{
                }),);

}
