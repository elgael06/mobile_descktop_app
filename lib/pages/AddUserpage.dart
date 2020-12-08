import 'package:abc_app/controllers/user.controllers.dart';
import 'package:abc_app/widgets/InputLabel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserPage extends StatelessWidget {
  final UserControllers userController = Get.find();

  Future _saveUser() async {
    print('guardar');
    bool res = await userController.saveUser();
    print(res);
  }

  openImage() async {
    print('get image ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Nuevo usuario'),
        centerTitle: true,
        actions: [_buttonSave()],
      ),
      body: GetBuilder<UserControllers>(
          dispose: (_) => userController.listaUsuarios(),
          initState: (_) => userController.newUser(),
          id: 'form_user',
          builder: (_) => Container(
                  child: ListView(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 10,
                  right: 10,
                ),
                children: [
                  _imageAvatar(),
                  inputLabel('Nombre', userController.changeUser('name'), true,
                      userController.selectUser.name, TextInputType.text),
                  inputLabel(
                      'Email',
                      userController.changeUser('emailid'),
                      true,
                      userController.selectUser.emailid,
                      TextInputType.emailAddress),
                  inputLabel(
                      'Telefono',
                      userController.changeUser('contact'),
                      true,
                      userController.selectUser.contact,
                      TextInputType.phone),
                  inputLabel('Puesto', userController.changeUser('type'), true,
                      userController.selectUser.type, TextInputType.text),
                ],
              ))),
    );
  }

  Widget _imageAvatar() {
    return FloatingActionButton(
        child: Icon(
          Icons.person_add_alt,
          size: 35,
        ),
        elevation: 10,
        onPressed: openImage);
  }

  Widget _buttonSave() {
    return IconButton(
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        onPressed: _saveUser);
  }
}
