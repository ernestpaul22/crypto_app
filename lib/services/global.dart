import 'package:hive/hive.dart' show Box;
import './hive.dart';

enum BOX_NAME {
  CURRENCY_BOX,
}

class Global {
  static final Map<BOX_NAME, Box> boxes = {
    BOX_NAME.CURRENCY_BOX: HiveInstance.currencyBox
  };
}
