import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../screens/big_photo_screen.dart';

class ServiceScreen extends StatefulWidget {
  static const routeName = '/service';

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  bool isActivityChartOpen = false;
  bool isLatestProjectsOpen = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceType = getDeviceType(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ScreenTypeLayout(
        desktop: Padding(
          padding: EdgeInsets.fromLTRB(100, 50, 50, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _nameBox(theme),
                    const SizedBox(
                      height: 200,
                    ),
                    _getRichText(theme, deviceType),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam feugiat dui at felis lacinia sollicitudin. Pellentesque massa felis, egestas id nisl at, dignissim pellentesque lectus. Proin porttitor mi vel sapien pellentesque, sed congue est fermentum. Integer nisi sapien, ultricies vel lobortis et, laoreet at justo.',
                        style: theme.textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                            fontSize: 18,
                            height: 1.8))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _activityChartText(theme),
                            const SizedBox(
                              width: 70,
                            ),
                            _latestProjectsText(theme),
                          ],
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getActivityChart(),
                          const SizedBox(
                            width: 43,
                          ),
                          _getLatestProjects(theme),
                        ],
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Align(
                      child: AnimatedContainer(
                        margin: const EdgeInsets.only(top: 300),
                        duration: Duration(milliseconds: 500),
                        child: _getFlatCheckProjectsButton(theme),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        mobile: Scrollbar(
          thickness: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  _nameBox(theme),
                  const SizedBox(
                    height: 120,
                  ),
                  _getRichText(theme, deviceType),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam feugiat dui at felis lacinia sollicitudin. Pellentesque massa felis, egestas id nisl at, dignissim pellentesque lectus. Proin porttitor mi vel sapien pellentesque, sed congue est fermentum. Integer nisi sapien, ultricies vel lobortis et, laoreet at justo.',
                      style: theme.textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                          fontSize: 16,
                          height: 1.8),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 50,
                  ),
                  _getFlatCheckProjectsButton(theme),
                  const SizedBox(
                    height: 70,
                  ),
                  _latestProjectsText(theme),
                  _getLatestProjects(theme),
                  const SizedBox(
                    height: 70,
                  ),
                  _activityChartText(theme),
                  _getActivityChart(),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getActivityChart() => AnimatedContainer(
        constraints: BoxConstraints(minHeight: isActivityChartOpen ? 200 : 0),
        width: 250,
        height: isActivityChartOpen ? 200 : 0,
        color: isActivityChartOpen ? Color(0xff181818) : Colors.transparent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: InkWell(
            child: Image.network(
              'https://wakatime.com/share/@FY/40d4f268-0834-4a91-9a39-c0796a830f12.png',
              fit: BoxFit.fill,
            ),
            onTap: () => Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) =>
                    BigPhotoScreen()))),
      );

  Widget _getLatestProjects(ThemeData theme) => AnimatedContainer(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: isLatestProjectsOpen ? 200 : 0),
        width: 250,
        height: isLatestProjectsOpen ? 200 : 0,
        color: isLatestProjectsOpen ? Color(0xff181818) : Colors.transparent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: isLatestProjectsOpen
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Project 1",
                    style: theme.textTheme.headline5,
                  ),
                  Divider(),
                  Text(
                    "Project 2",
                    style: theme.textTheme.headline5,
                  ),
                  Divider(),
                  Text(
                    "Project 3",
                    style: theme.textTheme.headline5,
                  ),
                  Divider(),
                  Text(
                    "Project 4",
                    style: theme.textTheme.headline5,
                  ),
                ],
              )
            : null,
      );

  Widget _nameBox(ThemeData theme) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Kotlin-logo.svg/1024px-Kotlin-logo.svg.png',
            width: 90,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'KACPER JÓZEF\nWOJAK',
            style: theme.textTheme.headline4.copyWith(letterSpacing: 2),
          ),
        ],
      );

  Widget _getRichText(ThemeData theme, DeviceScreenType deviceType) => Column(
        children: [
          RichText(
            textAlign: deviceType == DeviceScreenType.desktop
                ? TextAlign.start
                : TextAlign.center,
            text: TextSpan(
                text: "",
                style: theme.textTheme.headline1
                    .copyWith(fontSize: 80, height: 0.5),
                children: [
                  TextSpan(
                    text: 'KOTLIN',
                    style: theme.textTheme.headline1.copyWith(
                        fontSize:
                            deviceType == DeviceScreenType.desktop ? 80 : 50,
                        height: 1.1,
                        color: theme.primaryColor),
                  ),
                  TextSpan(
                    text: deviceType == DeviceScreenType.desktop
                        ? ' SUPPORT\nAND FULL APPS'
                        : '\nSUPPORT\nAND FULL APPS',
                    style: theme.textTheme.headline1.copyWith(
                        fontSize:
                            deviceType == DeviceScreenType.desktop ? 80 : 50,
                        height: 1),
                  ),
                ]),
          ),
        ],
      );

  Widget _latestProjectsText(ThemeData theme) => Column(
        children: [
          Text(
            'LATEST PROJECTS',
            style: theme.textTheme.headline4.copyWith(letterSpacing: 2),
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () =>
                setState(() => isLatestProjectsOpen = !isLatestProjectsOpen),
          ),
        ],
      );

  Widget _activityChartText(ThemeData theme) => Column(
        children: [
          Text(
            'SHOW ACTIVITY CHART',
            style: theme.textTheme.headline4.copyWith(letterSpacing: 2),
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() => isActivityChartOpen = !isActivityChartOpen);
              if (isActivityChartOpen) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Click on chart to make it bigger')));
              }
            },
          ),
        ],
      );

  Widget _getFlatCheckProjectsButton(ThemeData theme) => FlatButton(
        onPressed: () {},
        child: Text(
          'Check my projects',
          style: theme.textTheme.headline4
              .copyWith(fontWeight: FontWeight.w700, fontSize: 17),
        ),
        color: theme.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      );
}
