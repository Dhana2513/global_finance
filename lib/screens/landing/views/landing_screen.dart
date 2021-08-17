import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentum_test/screens/landing/landing_controller.dart';
import 'package:momentum_test/screens/landing/views/service_item_view.dart';
import 'options_carousel_view.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final LandingController _landingController = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, ${_landingController.getUserName()}',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Icon(
              Icons.notifications_none_outlined,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OptionsCarouselView(),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24),
            child: Text(
              'Services',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount: 3,
            children: [
              ServiceItemView(
                icon: Icons.savings_outlined,
                serviceName: 'Fund',
              ),
              ServiceItemView(
                icon: Icons.send_to_mobile_outlined,
                serviceName: 'Send Money',
              ),
              ServiceItemView(
                icon: Icons.account_balance_outlined,
                serviceName: 'Back Transfer',
              ),
              ServiceItemView(
                icon: Icons.payments_outlined,
                serviceName: 'Loan Request',
              ),
              ServiceItemView(
                icon: Icons.phone_android_outlined,
                serviceName: 'Airtime',
              ),
              ServiceItemView(
                icon: Icons.credit_card_outlined,
                serviceName: 'Cards',
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.8),
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                _landingController.onLogoutClick(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.savings_outlined,
            ),
            label: 'Investment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_sharp),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: 'Credit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
