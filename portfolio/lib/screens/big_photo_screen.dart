import 'package:flutter/material.dart';

class BigPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black54,
      body: GestureDetector(
          onTap: () => _goBack(context),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black54,
            child: Stack(children: [
              Align(
                child: Image.network(
                    'https://wakatime.com/share/@FY/40d4f268-0834-4a91-9a39-c0796a830f12.png'),
                alignment: Alignment.center,
              ),
              Align(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: theme.primaryColor,
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () => _goBack(context),
                      iconSize: 40),
                ),
                alignment: Alignment.topLeft,
              ),
            ]),
          ),
        ),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    Navigator.of(context).pop();
    return true;
  }
}
