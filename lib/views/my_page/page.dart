import 'package:fish_redux/fish_redux.dart';
import 'package:movie/views/my_page/components/favorites_component/component.dart';
import 'package:movie/views/my_page/components/favorites_component/state.dart';
import 'package:movie/views/my_page/components/concern_component/component.dart';
import 'package:movie/views/my_page/components/concern_component/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyPage extends Page<MyState, Map<String, dynamic>> {
  MyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyState>(
                adapter: null,
                slots: <String, Dependent<MyState>>{
                  'favorites': FavoritesConnector() + FavoritesComponent(),
                  'concerns': ConcernConnector() + ConcernComponent(),
                }),
            middleware: <Middleware<MyState>>[
            ],);

}
