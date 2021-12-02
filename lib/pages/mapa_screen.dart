import 'package:flutter/material.dart';

class MapaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) => ListTile(
          leading: Icon(
            Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('https://cualquiercosa'),
          subtitle: Text('id:1'),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => print('Abrir algo...'),
        ),
      ),
    );
  }
}
