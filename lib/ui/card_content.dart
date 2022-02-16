import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;
  final double price;
  CardContent(
      {Key? key,
      required this.name,
      required this.date,
      required this.offset,
      required this.price})
      : super(key: key);

  final ButtonStyle customBtnStyle = ElevatedButton.styleFrom(
    primary: const Color(0xFF162A49),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    textStyle: const TextStyle(
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: ElevatedButton(
                  style: customBtnStyle,
                  onPressed: () {},
                  child: Transform.translate(
                    offset: Offset(24 * offset, 0),
                    child: const Text('Reserve'),
                  ),
                ),
              ),
              const Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  '$price \$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
