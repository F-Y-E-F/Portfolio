import '../models/social_media.dart';

class SocialMediaList {
  List<SocialMedia> getFirstLine() => [
        SocialMedia(
            'assets/images/facebook.png',
            'https://www.facebook.com/kacper.wojak.56'),
        SocialMedia(
            'assets/images/linkedin.png',
            'https://www.linkedin.com/in/kacper-wojak-9174821bb'),
        SocialMedia(
            'assets/images/reddit.png',
            'https://www.reddit.com/user/FYEF'),
        SocialMedia(
            'assets/images/github.png',
            'https://github.com/F-Y-E-F')
      ];

  List<SocialMedia> getSecondLine() => [
        SocialMedia(
            'assets/images/twitter.png',
            'https://twitter.com/kacper_wojak'),
        SocialMedia(
            'assets/images/instagram.png',
            'https://www.instagram.com/kacper_wojak'),
        SocialMedia(
            'assets/images/gmail.png',
            'mailto:kacperwojak17@gmail.com'),
        SocialMedia(
            'assets/images/discord.png',
            'https://discord.com/users/694800348040134716')
      ];
}
