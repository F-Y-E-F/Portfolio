import '../models/service.dart';

class ServiceList {
  List<Service> getServiceList() => [
        Service(
            'Kotlin Support',
            'And Full Apps',
            'I can create mobile apps or features in kotlin. Also I can join to already started project. I know basics of team work in git version control. I know a lot of firebase features',
            'I can create mobile apps or features in kotlin. Also I can join to already started project. I know basics of team work in git version control. I can create kotlin apps with: hilt, koin DI,  Retrofit, Rxjava, Coroutines, Firebase : Auth,  Cloud Firestore, Realtime database, notifications, storage. I know Room database MVVM clean architecture model, basics of material design, integrations with android features and more.',
            'assets/images/kotlin.png'),
        Service(
            'Android Apps',
            'And Features',
            'I can create full android mobile app from basics or join recently project. I know a lof of features and design styles. Also I can work with team using git control system. ',
            'I can create full android mobile app from basics or join recently project. I know a lof of features and design styles. Also I can work with team using git control system. I can create your own app, which you just want to. I know android system architecture, I can create apps with newest android features. Also I can integrate apps with your backed.',
            'assets/images/android.png'),
        Service(
            'Flutter Apps',
            'And support',
            'I can create mobile, desktop, web apps in flutter from basics or join recently work. I know a lot of widgets and their applications. Also I can apply state management to app.' ,
            'I can create mobile, desktop, web apps in flutter from basics or join recently work. I know a lot of widgets and their applications. Also I can apply state management to app. I\'m able to implementation a lof of features using firebase and another libraries from pub.dev. I can apply Providers state management in recently created app.',
            'assets/images/flutter.png')
      ];
}
