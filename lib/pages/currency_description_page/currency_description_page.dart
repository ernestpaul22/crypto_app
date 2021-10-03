import 'package:crypto_app/models/currency_data.dart';
import 'package:crypto_app/services/global.dart';
import 'package:crypto_app/styles/fonts.dart';

import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
