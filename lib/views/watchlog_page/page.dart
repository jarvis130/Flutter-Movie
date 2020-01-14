import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WatchLogPage extends Page<WatchLogState, Map<String, dynamic>> {
  WatchLogPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WatchLogState>(
                adapter: null,
                slots: <String, Dependent<WatchLogState>>{
                }),
            middleware: <Middleware<WatchLogState>>[
            ],);

}
