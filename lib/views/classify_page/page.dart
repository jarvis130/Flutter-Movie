import 'package:fish_redux/fish_redux.dart';
import 'package:movie/widgets/custom_stfstate.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ClassifyPage extends Page<ClassifyPageState, Map<String, dynamic>> {
  
  @override
  CustomstfState<ClassifyPageState> createState()=>CustomstfState<ClassifyPageState> ();

  ClassifyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ClassifyPageState>(
                adapter: null,
                slots: <String, Dependent<ClassifyPageState>>{
                }),
            middleware: <Middleware<ClassifyPageState>>[
            ],);

}
