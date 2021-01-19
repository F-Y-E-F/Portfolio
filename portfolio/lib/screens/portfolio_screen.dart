import 'package:animated_grid/animated_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/helpers/social_media_list.dart';
import 'package:portfolio/widgets/social_media_item.dart';
import '../helpers/service_list.dart';
import '../helpers/resume_lists.dart';
import '../providers/apps.dart';
import '../widgets/resume_list_item.dart';
import '../widgets/service_Item.dart';
import 'package:provider/provider.dart';
import '../widgets/app_grid_item.dart';

class PortfolioScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController scrollController = ScrollController();
  final resumeLists = ResumeLists();

  int hovered = -1;
  int clickedPortfolioType = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final apps = Provider
        .of<Apps>(context)
        .apps;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Scrollbar(
          thickness: 5,
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
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
                ),
                const SizedBox(
                  height: 100,
                ),
                _getTitleText(theme, "Featured ", "Portfolio"),
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
                _getTitleText(theme, "My ", "Resume"),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
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
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
                      height: 780,
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: resumeLists
                              .getEducationsList()
                              .map((resume) =>
                              ResumeListItem(
                                  resume.name,
                                  resume.description,
                                  resume.endTime,
                                  resume.place))
                              .toList()),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
                      height: 780,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: resumeLists
                            .getExperienceList()
                            .map((resume) =>
                            ResumeListItem(
                                resume.name,
                                resume.description,
                                resume.endTime,
                                resume.place))
                            .toList(),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getTitleText(theme, "About ", "Me"),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDuis semper diam at lacus condimentum, id efficitur.\nNullam ornare dignissim nibh ac tempus.",
                          style: theme.textTheme.headline4.copyWith(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff8f8f8f),
                              fontSize: 19),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDuis semper diam at lacus condimentum, id efficitur.\nNullam ornare dignissim nibh ac tempus.",
                          style: theme.textTheme.headline6.copyWith(
                              color: const Color(0xff8f8f8f),
                              fontSize: 16,
                              letterSpacing: 0.7),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 19),
                              onPressed: () {},
                              child: Text(
                                'HIRE ME',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Lato',
                                    letterSpacing: 1.0),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              color: theme.primaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 19),
                              onPressed: () {},
                              child: Text(
                                'VISIT MY GITHUB',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Lato',
                                    letterSpacing: 1.0),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              color: const Color(0xff8f8f8f),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                _getTitleText(theme, "My ", "Services"),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ServiceList()
                      .getServiceList()
                      .map((service) =>
                      ServiceItem(
                          service.title, service.description, service.image))
                      .toList(),
                ),
                const SizedBox(
                  height: 120,
                ),
                _getTitleText(theme, "Get ", "In Touch"),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
                      child: Text(
                        "Get In Touch",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headline2
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
                      child: Text(
                        "Find Me On!",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headline2
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.7,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'name',
                                    hintStyle: theme.textTheme.headline4
                                        .copyWith(
                                        fontSize: 16, color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    fillColor: Color(0xFF202020),
                                    filled: true),
                                style: theme.textTheme.headline4
                                    .copyWith(fontSize: 15),
                                cursorColor: theme.primaryColor,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.7,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'email',
                                    hintStyle: theme.textTheme.headline4
                                        .copyWith(
                                        fontSize: 16, color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    fillColor: Color(0xFF202020),
                                    filled: true),
                                style: theme.textTheme.headline4
                                    .copyWith(fontSize: 15),
                                cursorColor: theme.primaryColor,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.7,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'phone',
                                    hintStyle: theme.textTheme.headline4
                                        .copyWith(
                                        fontSize: 16, color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    fillColor: Color(0xFF202020),
                                    filled: true),
                                style: theme.textTheme.headline4
                                    .copyWith(fontSize: 15),
                                cursorColor: theme.primaryColor,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.7,
                              child: TextField(
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                minLines: 10,
                                maxLines: 20,
                                decoration: InputDecoration(
                                    hintText: 'message',
                                    hintStyle: theme.textTheme.headline4
                                        .copyWith(
                                        fontSize: 16, color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    fillColor: Color(0xFF202020),
                                    filled: true),
                                style: theme.textTheme.headline4
                                    .copyWith(fontSize: 15),
                                cursorColor: theme.primaryColor,
                              )),
                          const SizedBox(
                            height: 40,
                          ),
                          FlatButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 25),
                            onPressed: () {},
                            child: Text(
                              'SEND MESSAGE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Lato',
                                  letterSpacing: 1.0),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: SocialMediaList().getFirstLine()
                                  .map((socialMedia) => SocialMediaItem(socialMedia.image,socialMedia.url)).toList()
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  SocialMediaList().getSecondLine()
                                .map((socialMedia) => SocialMediaItem(socialMedia.image,socialMedia.url)).toList()
                          ),

                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: theme.primaryColor,width: 2),
                              borderRadius: BorderRadius.circular(2)
                            ),
                            child: Column(
                              children: [
                                Text("Contact me on what you want to!",style: theme.textTheme.headline4,),
                                SizedBox(height: 5,),
                                Text("If you want to get my full CV",style: theme.textTheme.headline5,),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
        )
    );
  }

  //--------------------------| Get menu color item |---------------------------
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
          scrollController.animateTo(offset,
              duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
        onHover: (isHover) {
          setState(() => isHover ? hovered = position : hovered = -1);
        },
      );

  //============================================================================

  //--------------------------| get app type text widget |-------------------------------

  Widget _getPortfolioAppTypeText(String text, ThemeData theme,
      int clickedPosition) =>
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
            Provider.of<Apps>(context, listen: false).getApps(clickedPosition);
          });

  //=======================================================================================

  //-----------------------------| Get title 2-color text |---------------------------------
  Widget _getTitleText(ThemeData theme, String normalText, String yellowText) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            normalText,
            style: theme.textTheme.headline1
                .copyWith(fontWeight: FontWeight.w400, fontSize: 42.0),
          ),
          Text(
            yellowText,
            style: theme.textTheme.headline1
                .copyWith(fontSize: 42.0, color: theme.primaryColor),
          ),
        ],
      );

//===========================================================================================

}
