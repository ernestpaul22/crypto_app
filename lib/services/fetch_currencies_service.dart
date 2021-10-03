import 'package:crypto_app/models/currency_data.dart';
import 'package:crypto_app/services/global.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class FetchCurrenciesService {
  fetchCryptoData() async {
    String apiUrl = 'https://coinranking1.p.rapidapi.com/coins';
    try {
      http.Response response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Host': 'coinranking1.p.rapidapi.com',
        "X-RapidAPI-Key": "42e9b2988bmshb5790e0bbbdfca4p1e6f46jsn52565912323f",
      });
      convert.jsonDecode(response.body)["data"]["coins"].forEach((e) {
        _saveCurrencyDataLocally(
            e['name'],
            CurrencyData(
                name: e['name'],
                marketCap: e['marketCap'],
                price: e['price'],
                change: e['change'].toString(),
                iconUrl: e['iconUrl'],
                history: e['history'],
                description: e['description']));
      });
    } catch (e) {}
  }

  _saveCurrencyDataLocally(String id, CurrencyData currencyData) {
    Global.boxes[BOX_NAME.CURRENCY_BOX]!.put(id, currencyData);
  }
}
