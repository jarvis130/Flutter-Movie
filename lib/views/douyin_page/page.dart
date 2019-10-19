import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DouyinPage extends Page<DouyinPageState, Map<String, dynamic>> {
  DouyinPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DouyinPageState>(
                adapter: null,
                slots: <String, Dependent<DouyinPageState>>{
                }),
            middleware: <Middleware<DouyinPageState>>[
            ],);

}
