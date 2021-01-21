import 'package:flutter/material.dart';
import '../../helpers/social_media_list.dart';
import '../../widgets/social_media_item.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: mediaQuery.size.width / 3.7,
              child: Text(
                "Get In Touch",
                textAlign: TextAlign.center,
                style: theme.textTheme.headline2
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              width: mediaQuery.size.width / 3.7,
              child: Text(
                "Find Me On!",
                textAlign: TextAlign.center,
                style: theme.textTheme.headline2
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTextField(mediaQuery, theme, 'name'),
                  _getTextField(mediaQuery, theme, 'email'),
                  _getTextField(mediaQuery, theme, 'phone'),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      width: mediaQuery.size.width / 3.7,
                      child: TextField(
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        minLines: 10,
                        maxLines: 20,
                        decoration: InputDecoration(
                            hintText: 'message',
                            hintStyle: theme.textTheme.headline4
                                .copyWith(fontSize: 16, color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            fillColor: Color(0xFF202020),
                            filled: true),
                        style: theme.textTheme.headline4.copyWith(fontSize: 15),
                        cursorColor: theme.primaryColor,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  FlatButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 25),
                    onPressed: () {},
                    child: Text(
                      'SEND MESSAGE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Lato',
                          letterSpacing: 1.0),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    color: theme.primaryColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              width: MediaQuery.of(context).size.width / 3.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: SocialMediaList()
                          .getFirstLine()
                          .map((socialMedia) => SocialMediaItem(
                              socialMedia.image, socialMedia.url))
                          .toList()),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: SocialMediaList()
                          .getSecondLine()
                          .map((socialMedia) => SocialMediaItem(
                              socialMedia.image, socialMedia.url))
                          .toList()),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: theme.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(2)),
                    child: Column(
                      children: [
                        Text(
                          "Contact me on what you want to!",
                          style: theme.textTheme.headline4,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "If you want to get my full CV",
                          style: theme.textTheme.headline5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _getTextField(
          MediaQueryData mediaQuery, ThemeData theme, String hint) =>
      Container(
        width: mediaQuery.size.width / 3.7,
        child: TextFormField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: theme.textTheme.headline4
                  .copyWith(fontSize: 16, color: Colors.grey),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              fillColor: Color(0xFF202020),
              filled: true),
          style: theme.textTheme.headline4.copyWith(fontSize: 15),
          cursorColor: theme.primaryColor,
        ),
        margin: EdgeInsets.only(top: 10),
      );
}
