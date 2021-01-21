import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  static const routeName = '/service';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: Text("SOME TEXT",style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
