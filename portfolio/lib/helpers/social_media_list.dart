import '../models/social_media.dart';

class SocialMediaList {
  List<SocialMedia> getFirstLine() => [
        SocialMedia(
            'assets/images/facebook.png',
            ''),
        SocialMedia(
            'assets/images/linkedin.png',
            ''),
        SocialMedia(
            'assets/images/reddit.png',
            ''),
        SocialMedia(
            'assets/images/github.png',
            '')
      ];

  List<SocialMedia> getSecondLine() => [
        SocialMedia(
            'assets/images/twitter.png',
            ''),
        SocialMedia(
            'assets/images/instagram.png',
            ''),
        SocialMedia(
            'assets/images/gmail.png',
            ''),
        SocialMedia(
            'assets/images/discord.png',
            '')
      ];
}
