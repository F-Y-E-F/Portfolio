enum ProgrammingLanguage { Flutter, Kotlin, Other }

class App {
  String name;
  DateTime releaseDate;
  ProgrammingLanguage programmingLanguage;
  String iconUrl;

  App({this.name, this.releaseDate, this.programmingLanguage, this.iconUrl});
}
