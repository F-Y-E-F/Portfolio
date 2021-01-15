import 'package:flutter/material.dart';

void main() {
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Color(0xFFFCA311),
        backgroundColor: Color(0xFF0E0E0E),
        accentColor: Color(0xFF202020),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(fontSize: 36.0,color: Colors.white,fontWeight: FontWeight.w700),
          headline2: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.w700),
          headline3: TextStyle(fontSize: 24.0,color: Colors.white,fontWeight: FontWeight.w500),
          headline4: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w400),
          headline5: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w300),
          headline6: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.w300)
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.headline6
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
