import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal:40.0,vertical: 30),
        width: MediaQuery.of(context).size.width / 4.9,
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
                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Kotlin-logo.svg/1024px-Kotlin-logo.svg.png',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Kotlin support',
              style: theme.textTheme.headline3.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Duis semper diam at lacus condimentum, id efficitur. Nullam ornare dignissim nibh ac tempus.",
              style: theme.textTheme.headline6.copyWith(
                  color: const Color(0xff8f8f8f),
                  fontSize: 16,
                  letterSpacing: 0.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 80,
            ),
            FlatButton(onPressed: (){}, child: Text("Check this out  >",style: theme.textTheme.headline5.copyWith(color: theme.primaryColor),),splashColor: Colors.transparent,highlightColor: Colors.transparent,)
          ],
        ));
  }
}
