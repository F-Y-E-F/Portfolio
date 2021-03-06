import 'package:flutter/material.dart';
import 'package:portfolio/helpers/launch_website.dart';

class SocialMediaItem extends StatelessWidget {


  final String image;
  final String url;
  SocialMediaItem(this.image,this.url);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 7,right: 7,bottom: 14),
      child: InkWell(
        onTap: () => LaunchWebsite().openNewWebsiteCard(url),
        splashColor: theme.primaryColor.withOpacity(0.3),
        highlightColor: theme.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          padding: const EdgeInsets.all(10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xff202020),
              borderRadius: BorderRadius.circular(100)),
          child: Image.asset(
            image,
            color: theme.primaryColor,
            scale: 15,
          ),
        ),
      ),
    );
  }
}
