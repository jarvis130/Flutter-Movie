import 'package:fish_redux/fish_redux.dart';
import 'package:movie/views/collect_page/components/favorites_component/component.dart';
import 'package:movie/views/collect_page/components/favorites_component/state.dart';
import 'package:movie/views/collect_page/components/concern_component/component.dart';
import 'package:movie/views/collect_page/components/concern_component/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CollectPage extends Page<CollectState, Map<String, dynamic>> {
  CollectPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CollectState>(
                adapter: null,
                slots: <String, Dependent<CollectState>>{
                  'favorites': FavoritesConnector() + FavoritesComponent(),
                  'concerns': ConcernConnector() + ConcernComponent(),
                }),
            middleware: <Middleware<CollectState>>[
            ],);

}
