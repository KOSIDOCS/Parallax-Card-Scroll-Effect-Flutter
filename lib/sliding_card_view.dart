import 'package:flutter/material.dart';
import 'package:parallax_card/ui/sliding_card.dart';

class SlidingCardView extends StatefulWidget {
  const SlidingCardView({Key? key}) : super(key: key);

  @override
  _SlidingCardViewState createState() => _SlidingCardViewState();
}

class _SlidingCardViewState extends State<SlidingCardView> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: PageView(
                controller: pageController,
                children: [
                  SlidingCard(
                    assetName: 'fried-chicken-wings-pub-food.jpg',
                    name: 'Fried Chicken Wings',
                    date: '4.20-30',
                    offset: pageOffset,
                    price: 90.00,
                  ),
                  SlidingCard(
                    assetName: 'pakora-sandwich-indian-food.jpg',
                    name: 'Indian Sandwich for 2',
                    date: '6.10-30',
                    offset: pageOffset,
                    price: 60.00,
                  ),
                  SlidingCard(
                    assetName: 'minimal-blue-plate-of-food-and-a-place-setting.jpg',
                    name: 'Full dinner for 4',
                    date: '7.20-30',
                    offset: pageOffset,
                    price: 200.00,
                  ),
                  SlidingCard(
                    assetName: 'dinner-salad.jpg',
                    name: 'Full Salad for 4',
                    date: '7.20-30',
                    offset: pageOffset,
                    price: 400.00,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
