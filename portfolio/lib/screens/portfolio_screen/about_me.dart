import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../helpers/launch_website.dart';
import '../../helpers/service_list.dart';
import '../../widgets/service_Item.dart';

class AboutMe extends StatelessWidget {
  final Function _getTitleText;
  final ScrollController _scrollController;

  AboutMe(this._getTitleText, this._scrollController);

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final theme = Theme.of(context);
    return Column(
      children: [
        ScreenTypeLayout(
          desktop: Row(
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
              _aboutMeTextContent(theme, deviceType, context)
            ],
          ),
          mobile: Column(
            children: [
              Image.asset(
                'assets/images/placeholder_two.jpg',
                width: MediaQuery.of(context).size.width - 70,
              ),
              const SizedBox(
                height: 60,
              ),
              _aboutMeTextContent(theme, deviceType, context)
            ],
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        _getTitleText(theme, "My ", "Services", deviceType),
        const SizedBox(
          height: 60,
        ),
        ScreenTypeLayout(
          desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getServiceList()),
          mobile: Column(
              children: _getServiceList()
                  .map((serviceItem) => Container(
                        child: serviceItem,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 15),
                      ))
                  .toList()),
          tablet: Wrap(
              children: _getServiceList()
                  .map((serviceItem) => Container(
                        child: serviceItem,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                      ))
                  .toList()),
        ),
        const SizedBox(
          height: 120,
        ),
      ],
    );
  }

  Widget _aboutMeTextContent(
          ThemeData theme, DeviceScreenType deviceType, BuildContext context) =>
      Padding(
        padding: EdgeInsets.only(
            right: deviceType != DeviceScreenType.desktop ? 40 : 0,
            left: deviceType != DeviceScreenType.desktop ? 40 : 0),
        child: Container(
          width: deviceType == DeviceScreenType.desktop
              ? 500
              : MediaQuery.of(context).size.width - 70,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'About ',
                    style: theme.textTheme.headline1.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: deviceType == DeviceScreenType.desktop
                            ? 42.0
                            : 36.0),
                  ),
                  Text(
                    'Me',
                    style: theme.textTheme.headline1.copyWith(
                        fontSize: deviceType == DeviceScreenType.desktop
                            ? 42.0
                            : 36.0,
                        color: theme.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Duis semper diam at lacus condimentum, id efficitur.Nullam ornare dignissim nibh ac tempus.",
                style: theme.textTheme.headline4.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff8f8f8f),
                    fontSize: deviceType == DeviceScreenType.desktop ? 19 : 17),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Duis semper diam at lacus condimentum, id efficitur. Nullam ornare dignissim nibh ac tempus.",
                style: theme.textTheme.headline6.copyWith(
                    color: const Color(0xff8f8f8f),
                    fontSize: deviceType == DeviceScreenType.desktop ? 16 : 14,
                    letterSpacing: 0.7),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceType == DeviceScreenType.mobile ? 30:40, vertical: 19),
                    onPressed: () => _scrollController.animateTo(
                        deviceType == DeviceScreenType.desktop
                            ? 4600
                            : deviceType == DeviceScreenType.tablet
                                ? 6150
                                : 8500,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut),
                    child: Text(
                      'HIRE ME',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceType == DeviceScreenType.mobile ? 14: 16,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceType == DeviceScreenType.mobile ? 30:40, vertical: 19),
                    onPressed: () async => await LaunchWebsite()
                        .openNewWebsiteCard('https://github.com/F-Y-E-F'),
                    child: Text(
                      'VISIT MY GITHUB',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceType == DeviceScreenType.mobile ? 14: 16,
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
        ),
      );

  List<Widget> _getServiceList() => ServiceList()
      .getServiceList()
      .map((service) =>
          ServiceItem(service.title, service.description, service.image))
      .toList();
}
