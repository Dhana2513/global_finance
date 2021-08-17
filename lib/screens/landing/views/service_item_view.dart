import 'package:flutter/material.dart';

class ServiceItemView extends StatelessWidget {
  final IconData icon;
  final String serviceName;

  const ServiceItemView({
    Key? key,
    required this.icon,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black87,
            size: 32,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            serviceName,
            style: TextStyle(
              color: Colors.black45,
            ),
          )
        ],
      ),
    );
  }
}
