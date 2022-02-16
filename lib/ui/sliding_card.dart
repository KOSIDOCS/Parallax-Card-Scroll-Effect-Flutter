import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parallax_card/ui/card_content.dart';
import 'dart:math' as math;

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;
  final double price;

  const SlidingCard(
      {Key? key,
      required this.name,
      required this.date,
      required this.assetName,
      required this.offset,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(offset.abs());
    }

    double gause = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08)); // <-- Gaussian function

    double alignCard = offset - 1.0;

    return Transform.translate(
      offset: Offset(-32 * gause * offset.sign, 0), //  Translate the cards to make space between them
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/images/$assetName',
                height: MediaQuery.of(context).size.height * 0.3,
                width: 330.0,
                alignment: Alignment(-alignCard.abs() + 1.0, 0), //<-- Set the alignment
                fit: BoxFit.none,
                scale: 2.0,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: CardContent(name: name, date: date, offset: gause, price: price)),
          ],
        ),
      ),
    );
  }
}
