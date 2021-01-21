import 'package:flutter/material.dart';


class WelcomeImage extends StatefulWidget {

  final ScrollController scrollController;
  WelcomeImage(this.scrollController);
  @override
  _WelcomeImageState createState() => _WelcomeImageState();
}

class _WelcomeImageState extends State<WelcomeImage> {
  int hovered;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getMenuItem('HOME', theme, 0, 0),
                  _getMenuItem('PORTFOLIO', theme, 1, 1050),
                  _getMenuItem('RESUME', theme, 2, 2250),
                  _getMenuItem('ABOUT', theme, 3, 3300),
                  _getMenuItem('CONTACT', theme, 4, 4600)
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
              image: const AssetImage(
                  'assets/images/placeholder.jpg'))),
    );
  }

  Widget _getMenuItem(
      String title, ThemeData theme, int position, double offset) =>
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 250),
            style: theme.textTheme.headline5.copyWith(
                letterSpacing: 1.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                color: hovered == position
                    ? theme.primaryColor
                    : Color(0xFFFFFFFF)),
            child: Text(
              title,
            ),
          ),
        ),
        onTap: () {
          widget.scrollController.animateTo(offset,
              duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
        onHover: (isHover) {
          setState(() => isHover ? hovered = position : hovered = -1);
        },
      );
}
