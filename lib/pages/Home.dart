import 'package:abc_app/pages/UsersList.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABC APP'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          _itemSelect('USUARIOS', UsersList(), Icons.person),
          _itemSelect('PRODUCTOS', UsersList(), Icons.post_add_rounded),
          _itemSelect('INVENTARIO', UsersList(), Icons.list),
        ],
      ),
    );
  }

  Widget _itemSelect(String title, Widget rute, IconData icon) =>
      GestureDetector(
          onTap: () => Get.to(rute, transition: Transition.fade),
          child: Container(
              color: Colors.black38,
              height: 50,
              width: 200,
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )));
}
