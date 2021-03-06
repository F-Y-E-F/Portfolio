import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/service_screen.dart';
import './providers/apps.dart';
import 'package:provider/provider.dart';
import './screens/portfolio_screen.dart';

void main() {
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Apps(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'OpenSans',
            primaryColor: Color(0xFFFCA311),
            backgroundColor: Color(0xFF0E0E0E),
            accentColor: Color(0xFF202020),
            colorScheme: ThemeData.light()
                .colorScheme
                .copyWith(onSurface: Color(0xFFBCBCBC)),
            textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                    fontSize: 36.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                headline2: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                headline3: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                headline4: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
                headline5: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
                headline6: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
            dividerColor: Colors.grey[700],
            snackBarTheme: SnackBarThemeData(
                backgroundColor: const Color(0xFF181818),
                behavior: SnackBarBehavior.floating,
                contentTextStyle: TextStyle(
                    color: const Color(0xFFFCA311),
                    fontSize: 15,
                    fontWeight: FontWeight.w700))),
        initialRoute: '/',
        routes: {
          PortfolioScreen.routeName: (context) => PortfolioScreen(),
          ServiceScreen.routeName: (context) => ServiceScreen(),
        },
      ),
    );
  }
}
