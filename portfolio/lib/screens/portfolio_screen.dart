import 'package:animated_grid/animated_grid.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/apps.dart';
import 'package:portfolio/widgets/resume_list_item.dart';
import 'package:provider/provider.dart';
import '../widgets/app_grid_item.dart';

class PortfolioScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int hovered = -1;
  int clickedPortfolioType = 0;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final apps = Provider.of<Apps>(context).apps;

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
                            _getMenuItem('HOME', theme, 0),
                            _getMenuItem('PORTFOLIO', theme, 1),
                            _getMenuItem('RESUME', theme, 2),
                            _getMenuItem('ABOUT', theme, 3),
                            _getMenuItem('CONTACT', theme, 4)
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
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Featured ",
                    style: theme.textTheme.headline1
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 42.0),
                  ),
                  Text(
                    "Portfolio",
                    style: theme.textTheme.headline1
                        .copyWith(fontSize: 42.0, color: theme.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getPortfolioAppTypeText("All", theme, 0),
                  _getPortfolioAppTypeText("Kotlin", theme, 1),
                  _getPortfolioAppTypeText("Flutter", theme, 2),
                  _getPortfolioAppTypeText("Other", theme, 3)
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  height: 900,
                  width: 1200,
                  child: AnimatedGrid(
                    height: 900,
                    width: 1200,
                    keys: apps,
                    cellRowNum: 2,
                    cellColNum: 3,
                    scrollDirection: Axis.horizontal,
                    sortOrder: SortOrder.rightToLeft,
                    builder: (context, index, _) => AppGridItem(apps[index]),
                  )),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My ",
                    style: theme.textTheme.headline1
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 42.0),
                  ),
                  Text(
                    "Resume",
                    style: theme.textTheme.headline1
                        .copyWith(fontSize: 42.0, color: theme.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.7,
                    child: Text(
                      "Education ",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline2
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.7,
                    child: Text(
                      "Experience",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline2
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.7,
                    height: 700,
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ResumeListItem(),
                        ResumeListItem(),
                        ResumeListItem()
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.7,
                    height: 700,
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ResumeListItem(),
                        ResumeListItem(),
                        ResumeListItem()
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/placeholder_two.jpg',
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "About ",
                            style: theme.textTheme.headline1.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 42.0),
                          ),
                          Text(
                            "Me",
                            style: theme.textTheme.headline1.copyWith(
                                fontSize: 42.0, color: theme.primaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDuis semper diam at lacus condimentum, id efficitur.\nNullam ornare dignissim nibh ac tempus.",
                        style: theme.textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDuis semper diam at lacus condimentum, id efficitur.\nNullam ornare dignissim nibh ac tempus.",
                        style: theme.textTheme.headline6
                            .copyWith(color: Colors.grey, fontSize: 15.5),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          FlatButton(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 19),
                            onPressed: () {},
                            child: Text(
                              'HIRE ME',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Lato',letterSpacing: 1.0),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            color: theme.primaryColor,
                          ),SizedBox(width: 10,),
                          FlatButton(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 19),
                            onPressed: () {},
                            child: Text(
                              'VISIT MY GITHUB',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Lato',letterSpacing: 1.0),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            color: Color(0xff8f8f8f),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My ",
                    style: theme.textTheme.headline1.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 42.0),
                  ),
                  Text(
                    "Services",
                    style: theme.textTheme.headline1.copyWith(
                        fontSize: 42.0, color: theme.primaryColor),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  //------------------- get to menu item ----------------------
  Widget _getMenuItem(String title, ThemeData theme, int position) => InkWell(
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
        onTap: () => print('tap'),
        onHover: (isHover) {
          setState(() => isHover ? hovered = position : hovered = -1);
        },
      );

  Widget _getPortfolioAppTypeText(
          String text, ThemeData theme, int clickedPosition) =>
      InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 250),
              style: theme.textTheme.headline4.copyWith(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w300,
                  color: clickedPortfolioType == clickedPosition
                      ? theme.primaryColor
                      : Color(0xFFFFFFFF)),
              child: Text(
                text,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              clickedPortfolioType = clickedPosition;
            });
            Provider.of<Apps>(context,listen: false).getApps(clickedPosition);
          });
}
