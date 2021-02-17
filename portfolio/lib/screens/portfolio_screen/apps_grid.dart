import 'package:animated_grid/animated_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../providers/apps.dart';
import '../../widgets/app_grid_item.dart';
import 'package:provider/provider.dart';

class AppsGrid extends StatefulWidget {
  @override
  _AppsGridState createState() => _AppsGridState();
}

class _AppsGridState extends State<AppsGrid> {
  int clickedPortfolioType = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final apps = Provider.of<Apps>(context).apps;
    final deviceType = getDeviceType(MediaQuery.of(context).size);

    return Column(
      children: [
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
            height: deviceType == DeviceScreenType.desktop ? 900 : deviceType == DeviceScreenType.mobile ?  apps.length*450.0 : apps.length%2 == 1 ? (apps.length+1)*450.0/2.0 : apps.length*450.0/2.0,
            width: deviceType == DeviceScreenType.desktop ? 1200: MediaQuery.of(context).size.width,
            child: AnimatedGrid(
              height: deviceType == DeviceScreenType.desktop ? 900 : deviceType == DeviceScreenType.mobile ? apps.length*450 : apps.length%2 == 1 ? (apps.length+1)*450/2 : apps.length*450/2,
              width: deviceType == DeviceScreenType.desktop ? 1200 : MediaQuery.of(context).size.width,
              keys: apps,
              cellRowNum: deviceType == DeviceScreenType.desktop ? 2 : deviceType == DeviceScreenType.mobile ? 6 : 3,
              cellColNum: deviceType == DeviceScreenType.desktop ? 3 : deviceType == DeviceScreenType.mobile ? 1 : 2 ,
              scrollDirection: deviceType == DeviceScreenType.desktop ? Axis.horizontal : Axis.vertical,
              sortOrder:  deviceType == DeviceScreenType.mobile ? SortOrder.topToBottom :  SortOrder.rightToLeft,
              builder: (context, index, _) => AppGridItem(apps[index]),
            )),
      ],
    );
  }

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
            Provider.of<Apps>(context, listen: false).getApps(clickedPosition);
          });
}
