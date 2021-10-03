import 'dart:async';

import 'package:crypto_app/pages/home_page/home_page.dart';
import 'package:crypto_app/services/fetch_currencies_service.dart';
import 'package:crypto_app/services/hive.dart';
import 'package:flutter/material.dart';

void main() async {
  await HiveInstance.initialiseHive();
  const duration = Duration(seconds: 1);
  Timer.periodic(
      duration, (Timer t) => FetchCurrenciesService().fetchCryptoData());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
