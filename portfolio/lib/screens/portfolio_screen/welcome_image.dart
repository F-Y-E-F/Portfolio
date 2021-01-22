import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WelcomeImage extends StatefulWidget {
  final ScrollController scrollController;

  WelcomeImage(this.scrollController);

  @override
  _WelcomeImageState createState() => _WelcomeImageState();
}

class _WelcomeImageState extends State<WelcomeImage>
    with TickerProviderStateMixin {
  int hovered;

  var _isMenuOpen = false;

  AnimationController _menuController;
  Animation<Size> _menuAnimation;

  @override
  void initState() {
    super.initState();

    _menuController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _menuAnimation =
        Tween<Size>(begin: Size(0, 0), end: Size(double.infinity, 275)).animate(
            CurvedAnimation(parent: _menuController, curve: Curves.easeInOut));
    _menuAnimation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Stack(
        children: [
          ScreenTypeLayout(
              desktop: Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ _getMenuItem('HOME', theme, 0, 0),
                      _getMenuItem('PORTFOLIO', theme, 1, 1050),
                      _getMenuItem('RESUME', theme, 2, 2250),
                      _getMenuItem('ABOUT', theme, 3, 3300),
                      _getMenuItem('CONTACT', theme, 4, 4600)
                    ],
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
              tablet:_mobileAndTabletMenu(),
              mobile:_mobileAndTabletMenu()
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
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "AND THIS IS MY PORTFOLIO",
                  style: theme.textTheme.headline4.copyWith(
                      letterSpacing: 2.0, color: Colors.white.withOpacity(0.8)),
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
              image: const AssetImage('assets/images/placeholder.jpg'))),
    );
  }

  Widget _getMenuItem(String title, ThemeData theme, int position,
      double offset) =>
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

  Widget _getMobileMenuItem(String title, double offset) =>
      GestureDetector(
          onTap: () {
            _menuController.reverse();
            widget.scrollController.animateTo(offset,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            width: double.infinity,
            child: Text(
              title,
              style: TextStyle(
                  color: const Color(0xff202020),
                  letterSpacing: 2.0,
                  fontFamily: 'Lato',
                  fontSize: 16),
            ),
          ));

  Widget _mobileAndTabletMenu() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            height: 55,
            width: double.infinity,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 0),
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  _isMenuOpen
                      ? _menuController.reverse()
                      : _menuController.forward();
                  _isMenuOpen = !_isMenuOpen;
                },
              ),
            ),
          ),
          Container(
            height: _menuAnimation.value.height,
            constraints:
            BoxConstraints(minHeight: _menuAnimation.value.height),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 8,),
                _getMobileMenuItem('HOME', 0),
                _getMobileMenuItem('PORTFOLIO', 1050),
                _getMobileMenuItem('RESUME', 2250),
                _getMobileMenuItem('ABOUT', 3300),
                _getMobileMenuItem('CONTACT', 5600)
              ],
            ),
          )
        ],
      );
}
