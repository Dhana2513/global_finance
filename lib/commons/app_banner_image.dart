import 'package:flutter/material.dart';

class AppBannerImage extends StatelessWidget {
  const AppBannerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/global_finance.png',
        height: 80,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
