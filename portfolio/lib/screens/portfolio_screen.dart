import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import './portfolio_screen/about_me.dart';
import './portfolio_screen/apps_grid.dart';
import './portfolio_screen/contact.dart';
import './portfolio_screen/resume_tabs.dart';
import './portfolio_screen/welcome_image.dart';


class PortfolioScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceType = getDeviceType(MediaQuery.of(context).size);


    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Scrollbar(
          thickness: 5,
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                WelcomeImage(scrollController),
                const SizedBox(
                  height: 100,
                ),
                _getTitleText(theme, "Featured ", "Portfolio",deviceType),
                const SizedBox(
                  height: 30,
                ),
                AppsGrid(),
                const SizedBox(
                  height: 80,
                ),
                _getTitleText(theme, "My ", "Resume",deviceType),
                const SizedBox(
                  height: 60,
                ),
                ResumeTabs(),
                const SizedBox(
                  height: 100,
                ),
                AboutMe(_getTitleText),
                _getTitleText(theme, "Get ", "In Touch",deviceType),
                const SizedBox(
                  height: 100,
                ),
                Contact(),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  "Copyright © All rights reserved | Kacper Wojak Portfolio CV",
                  style: theme.textTheme.headline4.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }


  //-----------------------------| Get title 2-color text |---------------------------------
  Widget _getTitleText(ThemeData theme, String normalText, String yellowText,deviceType) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            normalText,
            style: theme.textTheme.headline1
                .copyWith(fontWeight: FontWeight.w400, fontSize: deviceType == DeviceScreenType.desktop ? 42.0 : 36.0),
          ),
          Text(
            yellowText,
            style: theme.textTheme.headline1
                .copyWith(fontSize: deviceType == DeviceScreenType.desktop ? 42.0 : 36.0, color: theme.primaryColor),
          ),
        ],
      );

//===========================================================================================

}
