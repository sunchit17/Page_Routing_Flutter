import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routing Demo',
      home: Home(),
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Tap Me!'),
            onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExtractArgumentsScreen(),
              settings: RouteSettings(
                arguments: ScreenArguments(
                  'Extract Screen',
                  'Extracted Message',
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
