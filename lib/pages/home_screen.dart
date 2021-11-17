import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/custom_floating_button.dart';
import 'package:qr_scanner/widgets/custom_navbar.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Historial"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: Center(
        child: Text('Home screen'),
     ),
     bottomNavigationBar: CustomNavBar(),
     floatingActionButton: CustomFloatingButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}