import 'package:crypto_app/models/currency_data.dart';
import 'package:crypto_app/pages/currency_description_page/currency_description_page.dart';
import 'package:crypto_app/services/global.dart';
import 'package:crypto_app/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CurrenciesDataWidget extends StatelessWidget {
  const CurrenciesDataWidget({
    Key? key,
  }) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Global.boxes[BOX_NAME.CURRENCY_BOX]!.listenable(),
        builder: (context, Box box, wid) {
          final List<CurrencyData> currencyDataFromHive =
              List<CurrencyData>.from(box.values);
          return GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 50,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrencyDescriptionPage(
                                name: currencyDataFromHive[index].name)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.white,
                            child: buildImageWidget(
                                currencyDataFromHive[index].iconUrl),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Name : ' + currencyDataFromHive[index].name,
                          style: AppFonts.primaryBoldText,
                        ),
                        currencyDataFromHive[index].change.contains('-')
                            ? Row(
                                children: [
                                  Text(
                                    'Change : ' +
                                        currencyDataFromHive[index].change,
                                    style: AppFonts.secondaryText
                                        .copyWith(color: Colors.red),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.red,
                                    size: 40,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    'Change : ' +
                                        currencyDataFromHive[index].change,
                                    style: AppFonts.secondaryText
                                        .copyWith(color: Colors.green),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_up_sharp,
                                    color: Colors.green,
                                    size: 40,
                                  )
                                ],
                              ),
                        Text('Price : ' + currencyDataFromHive[index].price,
                            style: AppFonts.secondaryText),
                        Text(
                            'Market Cap : ' +
                                currencyDataFromHive[index]
                                    .marketCap
                                    .toString(),
                            style: AppFonts.secondaryText),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                      ],
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                  ),
                );
              });
        });
  }
}
