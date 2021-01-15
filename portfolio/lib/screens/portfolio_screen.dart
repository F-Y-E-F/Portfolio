import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "HOME",
                                  style: theme.textTheme.headline5.copyWith(
                                      letterSpacing: 1.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () => print('tap'),
                              onHover: (isHover) => print(isHover),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "PORTFOLIO",
                                  style: theme.textTheme.headline5.copyWith(
                                      letterSpacing: 1.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () => print('tap'),
                              onHover: (isHover) => print(isHover),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "RESUME",
                                  style: theme.textTheme.headline5.copyWith(
                                      letterSpacing: 1.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () => print('tap'),
                              onHover: (isHover) => print(isHover),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "ABOUT",
                                  style: theme.textTheme.headline5.copyWith(
                                      letterSpacing: 1.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () => print('tap'),
                              onHover: (isHover) => print(isHover),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "CONTACT",
                                  style: theme.textTheme.headline5.copyWith(
                                      letterSpacing: 1.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () => print('tap'),
                              onHover: (isHover) => print(isHover),
                            ),
                          ],
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
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
}
