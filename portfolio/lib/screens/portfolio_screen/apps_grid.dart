import 'package:animated_grid/animated_grid.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/apps.dart';
import 'package:portfolio/widgets/app_grid_item.dart';
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
