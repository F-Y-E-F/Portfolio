import 'package:flutter/material.dart';
import '../models/app.dart';

class AppGridItem extends StatefulWidget {
  final App app;
  AppGridItem(this.app);

  @override
  _AppGridItemState createState() => _AppGridItemState();
}

class _AppGridItemState extends State<AppGridItem> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaleTransition(
      scale: _animation,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.network(
              widget.app.iconUrl,
              width: 320,
              height: 320,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.app.name,
            style: theme.textTheme.headline5.copyWith(fontSize: 28.0),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.app.releaseDate.year.toString(),
            style: theme.textTheme.headline5
                .copyWith(fontSize: 22.0, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
