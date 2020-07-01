import 'package:flutter/material.dart';
import 'package:masterclass/store/app.store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(store.picture),
            Text("Nome: ${store.name}"),
            Text("E-mail: ${store.email}"),
          ],
        ),
      ),
    );
  }
}
