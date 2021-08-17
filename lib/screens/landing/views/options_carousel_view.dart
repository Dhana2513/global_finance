import 'package:flutter/material.dart';

class OptionsCarouselView extends StatelessWidget {
  const OptionsCarouselView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: PageController(
          viewportFraction: 0.9,
          initialPage: 0,
        ),
        children: [
          _getSlide(Color(0x00FFF10000), 'Wallet', '\$ 540,293.45',
              'Withdraw Funds >'),
          _getSlide(Color(0x00FFED9300), 'Loan', '\$ 540,293.45',
              'View Details >'),
          _getSlide(Color(0x00FF292B65), 'Wallet', '\$ 540,293.45',
              'Investment Account >'),
        ],
      ),
    );
  }

  Widget _getSlide(Color color, String title, String amount, String option) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              amount,
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  option,
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0x00FFBE9B00),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
