import '../models/service.dart';

class ServiceList {
  List<Service> getServiceList() => [
        Service(
            'Kotlin Support',
            'Lorem ipsum dolor sit amet, consecteturadipiscing elit. Duis semper diam atlacus condimentum, id efficitur.Nullam ornare dignissim nibh acsome more here',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Kotlin-logo.svg/1024px-Kotlin-logo.svg.png'),
        Service(
            'Android Apps',
            'Lorem ipsum dolor sit amet, consecteturadipiscing elit. Duis semper diam atlacus condimentum, id efficitur.Nullam ornare dignissim nibh acsome more here',
            'https://raw.githubusercontent.com/devicons/devicon/master/icons/android/android-original.svg'),
        Service(
            'Flutter Apps',
            'Lorem ipsum dolor sit amet, consecteturadipiscing elit. Duis semper diam atlacus condimentum, id efficitur.Nullam ornare dignissim nibh acsome more here',
            'https://cdn.worldvectorlogo.com/logos/flutter-logo.svg')
      ];
}
