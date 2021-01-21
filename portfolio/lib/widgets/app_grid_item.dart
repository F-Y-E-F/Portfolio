import 'package:flutter/material.dart';
import '../models/app.dart';
import 'package:url_launcher/url_launcher.dart';

class AppGridItem extends StatefulWidget {
  final App app;

  AppGridItem(this.app);

  @override
  _AppGridItemState createState() => _AppGridItemState();
}

class _AppGridItemState extends State<AppGridItem>
    with TickerProviderStateMixin {
  AnimationController _enterController;
  Animation<double> _enterAnimation;

  AnimationController _hoverController;
  Animation<double> _hoverAnimation;

  bool isHover = false;

  @override
  void initState() {
    super.initState();
    _enterController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..forward();
    _enterAnimation = CurvedAnimation(
      parent: _enterController,
      curve: Curves.fastOutSlowIn,
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _hoverAnimation = CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _enterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaleTransition(
      scale: _enterAnimation,
      child: Column(
        children: [
          Container(
            width: 320,
            height: 320,
            child: InkWell(
              onTap: (){},
              onHover: (isMouseHover) => isMouseHover ? _hoverController.forward() : _hoverController.reverse(),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        widget.app.iconUrl,
                        width: 320,
                        height: 320,
                      ),
                    ),
                  ),
                    FadeTransition(
                      opacity: _hoverAnimation,
                      child: Container(
                        width: 320,
                        height: 320,
                        color: Colors.black54,
                      ),
                    ),
                    FadeTransition(
                      opacity: _hoverAnimation,
                      child: Align(
                        alignment: Alignment.center,
                        child: FlatButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.white10,
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                          onPressed: _launchURL,
                          child: Text(
                            'Check this out',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.8
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2
                              )),
                        ),
                      ),
                    )
                ],
              ),
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

  Future<void> _launchURL() async {
    if (await canLaunch(widget.app.appUrl)) {
      await launch(widget.app.appUrl);
    } else {
      throw 'Could not launch ${widget.app.appUrl}';
    }
  }
}
