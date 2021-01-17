import 'package:flutter/material.dart';
import '../models/app.dart';

class Apps with ChangeNotifier{

  final _allApps = [
    App(
        name: "Some name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Another name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Fine name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Other,
        releaseDate: DateTime.now()),
    App(
        name: "Nice name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Rich name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Good name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
  ];


  List<App> get apps => [..._apps];


  List<App> _apps = [
    App(
        name: "Some name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Another name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Fine name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Other,
        releaseDate: DateTime.now()),
    App(
        name: "Nice name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Flutter,
        releaseDate: DateTime.now()),
    App(
        name: "Rich name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
    App(
        name: "Good name",
        iconUrl:
        "https://cdn.pixabay.com/photo/2020/05/04/18/55/avocado-5130214_960_720.png",
        programmingLanguage: ProgrammingLanguage.Kotlin,
        releaseDate: DateTime.now()),
  ];




    void getApps(int clickedPosition){
      switch (clickedPosition) {
        case 0:
          _apps = _allApps;
          break;
        case 1:
          _apps = _allApps
              .where((app) =>
          app.programmingLanguage == ProgrammingLanguage.Kotlin)
              .toList();
          break;
        case 2:
          _apps = _allApps
              .where((app) =>
          app.programmingLanguage ==
              ProgrammingLanguage.Flutter)
              .toList();
          break;
        case 3:
          _apps = _allApps
              .where((app) =>
          app.programmingLanguage == ProgrammingLanguage.Other)
              .toList();
          break;
        default:
          _apps = _allApps;
      }
      notifyListeners();
    }

}