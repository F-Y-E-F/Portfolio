import 'package:flutter/material.dart';
import '../models/app.dart';

class Apps with ChangeNotifier {
  final _allApps = [
    App(
        name: "Medicines App",
        iconUrl:
            "https://raw.githubusercontent.com/F-Y-E-F/medled/master/icon.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Medicine-App-In-Flutter'),
    App(
        name: "Imagine",
        iconUrl:
            "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Imagine'),
    App(
        name: "Spotify provider",
        iconUrl:
            "https://github.com/F-Y-E-F/Spotify-Controller-usign-Arduino-and-Python",
        programmingLanguage: ProgrammingLanguage.Other,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Spotify-Controller-usign-Arduino-and-Python'),
    App(
        name: "Meme app",
        iconUrl:
            "https://images.theconversation.com/files/177834/original/file-20170712-14488-19lw3sc.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Meme-App-In-Flutter'),
    App(
        name: "Medled",
        iconUrl:
            "https://raw.githubusercontent.com/F-Y-E-F/medled/master/icon.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/medled'),
    App(
        name: "Yeelight App",
        iconUrl:
            "https://raw.githubusercontent.com/F-Y-E-F/Yeelight-Control-Desktop-And-Mobile-Apps/main/Yeebum/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Yeelight-Control-Desktop-And-Mobile-Apps'),
  ];

  List<App> get apps => [..._apps];

  List<App> _apps = [
    App(
        name: "Medicines App",
        iconUrl:
        "https://raw.githubusercontent.com/F-Y-E-F/medled/master/icon.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Medicine-App-In-Flutter'),
    App(
        name: "Imagine",
        iconUrl:
        "https://raw.githubusercontent.com/F-Y-E-F/medled/master/icon.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Imagine'),
    App(
        name: "Spotify provider",
        iconUrl:
        "https://raw.githubusercontent.com/F-Y-E-F/medled/master/icon.png",
        programmingLanguage: ProgrammingLanguage.Other,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Spotify-Controller-usign-Arduino-and-Python'),
    App(
        name: "Meme app",
        iconUrl:
        "https://images.theconversation.com/files/177834/original/file-20170712-14488-19lw3sc.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Meme-App-In-Flutter'),
    App(
        name: "Medled",
        iconUrl:
        "https://raw.githubusercontent.com/F-Y-E-F/medled/master/icon.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/medled'),
    App(
        name: "Yeelight App",
        iconUrl:
        "https://raw.githubusercontent.com/F-Y-E-F/Yeelight-Control-Desktop-And-Mobile-Apps/main/Yeebum/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now(),
        appUrl: 'https://github.com/F-Y-E-F/Yeelight-Control-Desktop-And-Mobile-Apps'),
  ];

  void getApps(int clickedPosition) {
    switch (clickedPosition) {
      case 0:
        _apps = _allApps;
        break;
      case 1:
        _apps = _allApps
            .where(
                (app) => app.programmingLanguage == ProgrammingLanguage.Kotlin)
            .toList();
        break;
      case 2:
        _apps = _allApps
            .where(
                (app) => app.programmingLanguage == ProgrammingLanguage.Flutter)
            .toList();
        break;
      case 3:
        _apps = _allApps
            .where(
                (app) => app.programmingLanguage == ProgrammingLanguage.Other)
            .toList();
        break;
      default:
        _apps = _allApps;
    }
    notifyListeners();
  }
}
