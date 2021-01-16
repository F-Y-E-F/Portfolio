import 'package:animated_grid/animated_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/widgets/resume_list_item.dart';
import '../models/app.dart';
import '../widgets/app_grid_item.dart';

class PortfolioScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int hovered = -1;
  int clickedPortfolioType = 0;

  final allApps = [
    App(
        name: "Some name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Another name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Fine name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Other,
        releaseDate: DateTime.now()),
    App(
        name: "Nice name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Rich name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Good name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
  ];
  var apps = [
    App(
        name: "Some name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Another name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Fine name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Other,
        releaseDate: DateTime.now()),
    App(
        name: "Nice name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Rich name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Good name",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
  ];

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
                height: 40,
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      "Education ",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline2.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      "Experience",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline2.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),

                ],
              ),SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 700,
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ResumeListItem(),
                        ResumeListItem(),
                        ResumeListItem()
                      ],
                    ),
                  ), SizedBox(width: 25,),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
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
              )

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
              switch (clickedPosition) {
                case 0:
                  apps = allApps;
                  break;
                case 1:
                  apps = allApps
                      .where((app) =>
                          app.programmingLanguage == ProgrammingLanguage.Kotlin)
                      .toList();
                  break;
                case 2:
                  apps = allApps
                      .where((app) =>
                          app.programmingLanguage ==
                          ProgrammingLanguage.Flutter)
                      .toList();
                  break;
                case 3:
                  apps = allApps
                      .where((app) =>
                          app.programmingLanguage == ProgrammingLanguage.Other)
                      .toList();
                  break;
                default:
                  apps = allApps;
              }
            });
          });
}