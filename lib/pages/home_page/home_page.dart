import 'package:flutter/material.dart';

import 'home_page_components.dart/home_page_components.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Home',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          InternetStatusWidget(),
          CurrenciesDataWidget(),
        ],
      ),
    );
  }
}
