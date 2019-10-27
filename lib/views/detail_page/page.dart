import 'package:fish_redux/fish_redux.dart';
import 'package:movie/customwidgets/custom_stfstate.dart';

import 'components/menu_component/component.dart';
import 'components/menu_component/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MovieDetailPage extends Page<DetailPageState, Map<String, dynamic>> {
  @override
  CustomstfState<DetailPageState> createState() =>
      CustomstfState<DetailPageState>();
  MovieDetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DetailPageState>(
              adapter: null,
              slots: <String, Dependent<DetailPageState>>{
                'menu': MenuConnector() + MenuComponent()
              }),
          middleware: <Middleware<DetailPageState>>[],
        );
}
