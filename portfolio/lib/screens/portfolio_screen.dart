import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PortfolioScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _getMenuItem('HOME', theme),
                            _getMenuItem('PORTFOLIO', theme),
                            _getMenuItem('RESUME', theme),
                            _getMenuItem('ABOUT', theme),
                            _getMenuItem('CONTACT', theme)
                          ],
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 160,
                          ),
                          Text(
                            "Hello, I'm",
                            style: theme.textTheme.headline1.copyWith(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Lato',
                                fontSize: 64),
                          ),
                          Text(
                            "Kacper Wojak",
                            style: theme.textTheme.headline1
                                .copyWith(fontFamily: 'Lato', fontSize: 64),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "AND THIS IS MY PORTFOLIO",
                            style: theme.textTheme.headline4.copyWith(
                                letterSpacing: 2.0,
                                color: Colors.white.withOpacity(0.8)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            const AssetImage('assets/images/placeholder.jpg'))),
              ),
            ],
          ),
        ));
  }

  //------------------- get to menu item ----------------------
  Widget _getMenuItem(String title, ThemeData theme) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: theme.textTheme.headline5.copyWith(
                letterSpacing: 1.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500),
          ),
        ),
        onTap: () => print('tap'),
        onHover: (isHover) => print(isHover),
      );
}
