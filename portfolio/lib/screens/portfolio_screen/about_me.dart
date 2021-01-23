import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../helpers/launch_website.dart';
import '../../helpers/service_list.dart';
import '../../widgets/service_Item.dart';

class AboutMe extends StatelessWidget {
  final Function _getTitleText;
  AboutMe(this._getTitleText);
  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final theme = Theme.of(context);
    return Column(
      children: [
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
                _getTitleText(theme, "About ", "Me",deviceType),
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
                      onPressed: () async => await LaunchWebsite().openNewWebsiteCard('https://github.com/F-Y-E-F'),

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
        _getTitleText(theme, "My ", "Services",deviceType),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ServiceList()
              .getServiceList()
              .map((service) => ServiceItem(
                  service.title, service.description, service.image))
              .toList(),
        ),
        const SizedBox(
          height: 120,
        ),
      ],
    );
  }


}
