import 'package:flutter/cupertino.dart';
import 'package:imc/ui/ios/pages/home.page.dart';

class MyCupertinoApp extends StatefulWidget {
  @override
  _MyCupertinoAppState createState() => _MyCupertinoAppState();
}

class _MyCupertinoAppState extends State<MyCupertinoApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'IMC',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
