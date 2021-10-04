import 'package:crypto_app/styles/fonts.dart';
import 'package:flutter/material.dart';

class CustomGraph extends StatelessWidget {
  const CustomGraph({
    Key? key,
    required this.data,
    required this.children,
  }) : super(key: key);

  final List<double> data;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Graph',
            style: AppFonts.primaryBoldText.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            ' Max Price : ' + data.last.toString(),
            style: AppFonts.primaryBoldText,
          ),
          Text(
            ' Min Price : ' + data.first.toString(),
            style: AppFonts.primaryBoldText,
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 38),
            padding: EdgeInsets.only(bottom: 6),
            color: Colors.white,
            height: 100,
            width: data.length * 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
