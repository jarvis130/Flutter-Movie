
import 'package:toast/toast.dart';
class ToastUtils {
  static show(String msg, context, {duration = 2000}) {
    Toast.show(
        msg,
        context,
        duration: Toast.LENGTH_SHORT,
        gravity:  Toast.CENTER,
        backgroundRadius: 5
    );
  }

  static cancelToast() {
//    dismissAllToast();
  }
}
