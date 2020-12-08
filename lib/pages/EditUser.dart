import 'package:abc_app/widgets/InputLabel.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../controllers/user.controllers.dart';
import 'package:get/get.dart';

class EditUser extends StatelessWidget {
  final UserControllers userController = Get.find();

  Future _confirm() async {
    print('eliminado');
    await userController.deleteUserId();
  }

  _cancel() {
    print('cancelado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: GetBuilder<UserControllers>(
            builder: (_) => Text(
                  'Editar ${userController.selectUser.id}',
                  style: TextStyle(fontSize: 15),
                )),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.red,
            icon: Icon(Icons.delete),
            onPressed: _cancelAlert,
          ),
        ],
      ),
      body: Container(
          child: GetBuilder<UserControllers>(
        builder: (_) => ListView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          children: [
            inputLabel(
                'Nombre',
                userController.changeUser('name'),
                userController.statusEdit,
                userController.selectUser.name,
                TextInputType.text),
            inputLabel(
                'Email',
                userController.changeUser('emailid'),
                userController.statusEdit,
                userController.selectUser.emailid,
                TextInputType.emailAddress),
            inputLabel(
                'Telefono',
                userController.changeUser('contact'),
                userController.statusEdit,
                userController.selectUser.contact,
                TextInputType.phone),
            inputLabel(
                'Puesto',
                userController.changeUser('type'),
                userController.statusEdit,
                userController.selectUser.type,
                TextInputType.text),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Colors.green,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Guardar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print('guardar');
                  userController.saveEdit();
                },
              ),
            )
          ],
        ),
      )),
    );
  }

  Future _cancelAlert() async {
    await Get.defaultDialog(
        buttonColor: Colors.red,
        title: 'Eliminar Usuario.',
        middleText: 'El Usuario sera eliminado!!!',
        textConfirm: 'eliminar',
        textCancel: 'cancelar',
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black38,
        onConfirm: _confirm,
        onCancel: _cancel);
  }
}
