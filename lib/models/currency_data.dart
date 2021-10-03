import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'currency_data.g.dart';

@HiveType(typeId: 1)
class CurrencyData {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  String iconUrl;
  @HiveField(3)
  String price;
  @HiveField(4)
  List<dynamic> history;
  @HiveField(5)
  int marketCap;
  @HiveField(6)
  String change;
  CurrencyData({
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.price,
    required this.history,
    required this.marketCap,
    required this.change,
  });

  CurrencyData copyWith({
    String? name,
    String? description,
    String? iconUrl,
    String? price,
    List<dynamic>? history,
    int? marketCap,
    String? change,
  }) {
    return CurrencyData(
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      price: price ?? this.price,
      history: history ?? this.history,
      marketCap: marketCap ?? this.marketCap,
      change: change ?? this.change,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'price': price,
      'history': history,
      'marketCap': marketCap,
      'change': change,
    };
  }

  factory CurrencyData.fromMap(Map<String, dynamic> map) {
    return CurrencyData(
      name: map['name'],
      description: map['description'],
      iconUrl: map['iconUrl'],
      price: map['price'],
      history: List<dynamic>.from(map['history']),
      marketCap: map['marketCap'],
      change: map['change'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyData.fromJson(String source) =>
      CurrencyData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CurrencyData(name: $name, description: $description, iconUrl: $iconUrl, price: $price, history: $history, marketCap: $marketCap, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyData &&
        other.name == name &&
        other.description == description &&
        other.iconUrl == iconUrl &&
        other.price == price &&
        listEquals(other.history, history) &&
        other.marketCap == marketCap &&
        other.change == change;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        iconUrl.hashCode ^
        price.hashCode ^
        history.hashCode ^
        marketCap.hashCode ^
        change.hashCode;
  }
}
