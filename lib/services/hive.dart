import 'package:crypto_app/models/currency_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInstance {
  static late Box _currencyBox;
  static initialiseHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyDataAdapter());
    _currencyBox = await Hive.openBox('_currencyBox');
  }

  static Box get currencyBox {
    return _currencyBox;
  }
}
