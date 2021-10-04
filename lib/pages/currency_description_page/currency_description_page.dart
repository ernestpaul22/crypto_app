import 'package:crypto_app/models/currency_data.dart';
import 'package:crypto_app/services/global.dart';
import 'package:crypto_app/styles/fonts.dart';

import 'package:flutter/material.dart';
import 'currency_description_page_component/currency_descrition_page_components.dart';

class CurrencyDescriptionPage extends StatelessWidget {
  String name;
  CurrencyDescriptionPage({required this.name});
  Widget buildImageWidget(String url) {
    try {
      return Image.network(
        url, // this image doesn't exist
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/images/cryptoLogo.jpeg');
        },
      );
    } catch (e) {
      return Image.asset('assets/images/cryptoLogo.jpeg');
    }
  }

  Widget buildGraph(CurrencyData currencyData) {
    List<Widget> children = [];
    List<double> data = [];
    List<double> graphData = [];

    currencyData.history.forEach((e) {
      double a = double.parse(e);
      data.add(a);
      graphData.add(a);
    });
    data.sort();
    graphData.forEach((e) {
      e = e - data.first;
      print(e);
      children.add(Flexible(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          height: data.first > 100
              ? double.parse(e.toString()) / 10
              : data.first < 1
                  ? double.parse(e.toString()) * 2000
                  : data.first < 50
                      ? double.parse(e.toString()) * 10
                      : double.parse(e.toString()),
          width: 10,
          color: Colors.blue,
        ),
      ));
    });

    return CustomGraph(data: data, children: children);
  }

  Widget build(BuildContext context) {
    CurrencyData currencyData = Global.boxes[BOX_NAME.CURRENCY_BOX]!.get(name);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios)),
            ),
            Center(
                child: Text(
              currencyData.name,
              style: AppFonts.primaryBoldText.copyWith(fontSize: 24),
            )),
            Center(
              child: Container(
                  margin: EdgeInsets.all(24),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.height / 3,
                  child: buildImageWidget(currencyData.iconUrl)),
            ),
            Text(
              'Description',
              style: AppFonts.primaryBoldText,
            ),
            SizedBox(
              height: 6,
            ),
            Text(currencyData.description),
            SizedBox(
              height: 48,
            ),
            buildGraph(currencyData),
            SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
