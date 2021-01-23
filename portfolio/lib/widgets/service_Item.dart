import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../screens/service_screen.dart';

class ServiceItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  ServiceItem(this.title, this.description, this.image);

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);

    final theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.only(left: 17, right: 17),
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 40),
        width: deviceType == DeviceScreenType.mobile
            ? MediaQuery.of(context).size.width
            : deviceType == DeviceScreenType.desktop &&
                    MediaQuery.of(context).size.width > 1350
                ? MediaQuery.of(context).size.width / 5.3
                : deviceType == DeviceScreenType.tablet
                    ? MediaQuery.of(context).size.width / 2.3
                    : MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            color: const Color(0xff202020),
            borderRadius: BorderRadius.circular(2)),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.all(30),
              child: Image.network(
                image,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              title,
              style: theme.textTheme.headline3.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: theme.textTheme.headline6.copyWith(
                  color: const Color(0xff8f8f8f),
                  fontSize: 16,
                  letterSpacing: 0.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 70,
            ),
            FlatButton(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () =>
                  Navigator.of(context).pushNamed(ServiceScreen.routeName),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Check this out",
                    style: theme.textTheme.headline5
                        .copyWith(color: theme.primaryColor, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: theme.primaryColor,
                    size: 17,
                  )
                ],
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ));
  }
}
