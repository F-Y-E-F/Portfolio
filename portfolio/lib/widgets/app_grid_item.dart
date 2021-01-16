import 'package:flutter/material.dart';
import '../models/app.dart';

class AppGridItem extends StatelessWidget {
  final App app;
  AppGridItem(this.app);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.network(
            app.iconUrl,
            width: 300,
            height: 300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          app.name,
          style: theme.textTheme.headline5.copyWith(fontSize: 28.0),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          app.releaseDate.year.toString(),
          style: theme.textTheme.headline5
              .copyWith(fontSize: 22.0, color: Colors.grey),
        )
      ],
    );
  }
}
