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
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;

  var _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _slideAnimation = Tween<Offset>(
        begin: Offset(0, -6), end: Offset(0,0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
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
              tablet:_mobileAndTabletMenu(deviceType),
              mobile:_mobileAndTabletMenu(deviceType)
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 160,
                ),
                Text(
                  "Hello, I'm",
                  style: theme.textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Lato',
                      fontSize: deviceType == DeviceScreenType.desktop ? 64 : 48),
                ),
                Text(
                  "Kacper Wojak",
                  style: theme.textTheme.headline1
                      .copyWith(fontFamily: 'Lato', fontSize: deviceType == DeviceScreenType.desktop ? 64 : 48),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "AND THIS IS MY PORTFOLIO",
                  style: theme.textTheme.headline4.copyWith(
                      letterSpacing: 2.0, color: Colors.white.withOpacity(0.8), fontSize: deviceType == DeviceScreenType.desktop ? 20 : 16),
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
              duration: const Duration(milliseconds: 500), curve: Curves.linear);
        },
        onHover: (isHover) {
          setState(() => isHover ? hovered = position : hovered = -1);
        },
      );

  Widget _getMobileMenuItem(String title, double offset) =>
      GestureDetector(
          onTap: () {
            setState(() => _isMenuOpen = false);
            _controller.reverse();
            widget.scrollController.animateTo(offset,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
          },
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                width: double.infinity,
                child: Text(
                  title,
                  style: TextStyle(
                      color: const Color(0xff323232),
                      letterSpacing: 2.0,
                      fontFamily: 'Lato',
                      fontSize: 16),
                ),
              ),
            ),
          ));

  Widget _mobileAndTabletMenu(DeviceScreenType deviceType) =>
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
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  setState(()=>_isMenuOpen = ! _isMenuOpen);
                  if(_isMenuOpen) _controller.forward();
                  else _controller.reverse();
                },
              ),
            ),
          ),
          AnimatedContainer(
            height: _isMenuOpen ? 275 : 0,
            constraints:
            BoxConstraints(minHeight: _isMenuOpen? 275 : 0),
            color: Colors.white,
            width: double.infinity,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              children: [
                const SizedBox(height: 8,),
                _getMobileMenuItem('HOME', 0),
                _getMobileMenuItem('PORTFOLIO',1050),
                _getMobileMenuItem('RESUME', deviceType == DeviceScreenType.tablet ? 2700 : 4000),
                _getMobileMenuItem('ABOUT', deviceType == DeviceScreenType.tablet ? 3900 : 6000),
                _getMobileMenuItem('CONTACT', deviceType == DeviceScreenType.tablet ? 6150 : 8500)
              ],
            ),
          )
        ],
      );
}
