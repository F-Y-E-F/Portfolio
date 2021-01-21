enum ProgrammingLanguage { Flutter, Kotlin, Other }

class App {
  final String name;
  final DateTime releaseDate;
  final ProgrammingLanguage programmingLanguage;
  final String iconUrl;
  final String appUrl;

  App({this.name, this.releaseDate, this.programmingLanguage, this.iconUrl, this.appUrl});
}
