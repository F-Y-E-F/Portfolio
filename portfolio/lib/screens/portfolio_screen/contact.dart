import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../helpers/social_media_list.dart';
import '../../widgets/social_media_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final Map _emailData = Map<String, String>();
  final CollectionReference firestore = FirebaseFirestore.instance.collection('emails');
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final deviceType = getDeviceType(mediaQuery.size);

    return Column(
      children: [
        if (deviceType == DeviceScreenType.desktop)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getTitleText(mediaQuery, theme, 'Get In Touch', deviceType),
              const SizedBox(
                width: 25,
              ),
              _getTitleText(mediaQuery, theme, 'Find Me On', deviceType),
            ],
          ),
        const SizedBox(
          height: 30,
        ),
        ScreenTypeLayout(
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getContactFormContent(mediaQuery, theme, deviceType),
              _getSocialMediaContent(mediaQuery, theme, deviceType)
            ],
          ),
          mobile: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                _getTitleText(mediaQuery, theme, 'Get In Touch', deviceType),
                const SizedBox(
                  height: 20,
                ),
                _getContactFormContent(mediaQuery, theme, deviceType),
                const SizedBox(
                  height: 70,
                ),
                _getTitleText(mediaQuery, theme, 'Find Me On', deviceType),
                const SizedBox(
                  height: 30,
                ),
                _getSocialMediaContent(mediaQuery, theme, deviceType)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getTextField(MediaQueryData mediaQuery, ThemeData theme, String hint,
          DeviceScreenType deviceType) =>
      Container(
        width: deviceType == DeviceScreenType.desktop
            ? mediaQuery.size.width > 1500
                ? mediaQuery.size.width / 3.7
                : mediaQuery.size.width / 3
            : mediaQuery.size.width,
        child: TextFormField(
          validator:(val)=> val == null || val == "" ? "Please provide $hint" : (hint == 'email' && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)) ? "Please Provide correct email":null,
          keyboardType: hint == 'phone'
              ? TextInputType.phone
              : hint == 'email'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          onChanged: (val) => _emailData[hint] = val,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: theme.textTheme.headline4
                  .copyWith(fontSize: 16, color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              fillColor:const Color(0xFF202020),
              filled: true),
          style: theme.textTheme.headline4.copyWith(fontSize: 15),
          cursorColor: theme.primaryColor,
        ),
        margin: const EdgeInsets.only(top: 10),
      );

  Widget _getContactFormContent(MediaQueryData mediaQuery, ThemeData theme,
          DeviceScreenType deviceType) =>
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTextField(mediaQuery, theme, 'name', deviceType),
            _getTextField(mediaQuery, theme, 'email', deviceType),
            _getTextField(mediaQuery, theme, 'phone', deviceType),
            Container(
                margin: EdgeInsets.only(top: 10),
                width: deviceType == DeviceScreenType.desktop
                    ? mediaQuery.size.width > 1500
                        ? mediaQuery.size.width / 3.7
                        : mediaQuery.size.width / 3
                    : mediaQuery.size.width,
                child: TextFormField(
                  validator:(val)=> val.length < 10 ? "Please add some more text in message" :null,
                  onChanged: (val) => _emailData['content'] = val,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  minLines: 10,
                  maxLines: 20,
                  decoration: InputDecoration(
                      hintText: 'message',
                      hintStyle: theme.textTheme.headline4
                          .copyWith(fontSize: 16, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      fillColor: Color(0xFF202020),
                      filled: true),
                  style: theme.textTheme.headline4.copyWith(fontSize: 15),
                  cursorColor: theme.primaryColor,
                )),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: deviceType == DeviceScreenType.mobile ? 30:40, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                backgroundColor: theme.primaryColor,
              ),
              onPressed: () async {
                if(_formKey.currentState.validate()){
                  firestore.add({
                    'name':_emailData['name'],
                    'email':_emailData['email'],
                    'phone':_emailData['phone'],
                    'content':_emailData['content']
                  }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your mail has been sent")))).catchError((e) {
                    print(e);
                  });
                }
              },
              child: Text(
                'SEND MESSAGE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: deviceType == DeviceScreenType.mobile ? 15: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Lato',
                    letterSpacing: 1.0),
              ),
            ),
          ],
        ),
      );

  Widget _getSocialMediaContent(MediaQueryData mediaQuery, ThemeData theme,
          DeviceScreenType deviceType) =>
      Container(
        padding: deviceType == DeviceScreenType.desktop
            ? const EdgeInsets.only(left: 25)
            : null,
        width: deviceType == DeviceScreenType.desktop
            ? mediaQuery.size.width > 1500
                ? mediaQuery.size.width / 3.7
                : mediaQuery.size.width / 3
            : mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: SocialMediaList()
                    .getFirstLine()
                    .map((socialMedia) =>
                        SocialMediaItem(socialMedia.image, socialMedia.url))
                    .toList()),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: SocialMediaList()
                    .getSecondLine()
                    .map((socialMedia) =>
                        SocialMediaItem(socialMedia.image, socialMedia.url))
                    .toList()),
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: theme.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Contact me on what you want to!",
                    style: theme.textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "If you want to get my full CV",
                    style: theme.textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _getTitleText(MediaQueryData mediaQuery, ThemeData theme, String title,
          DeviceScreenType deviceType) =>
      Container(
        padding: const EdgeInsets.only(left: 5),
        width: deviceType == DeviceScreenType.desktop
            ? mediaQuery.size.width > 1500
                ? mediaQuery.size.width / 3.7
                : mediaQuery.size.width / 3
            : mediaQuery.size.width,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style:
              theme.textTheme.headline2.copyWith(fontWeight: FontWeight.w400),
        ),
      );
}
