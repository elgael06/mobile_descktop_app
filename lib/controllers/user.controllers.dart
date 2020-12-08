import 'package:abc_app/api/usuarios.api.dart';
import 'package:abc_app/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserControllers extends GetxController {
  List<UserModel> lista = [];
  UserModel selectUser;
  UsuariosAPI _conexionUsuarios = UsuariosAPI();
  bool statusEdit = true;

  @override
  void onClose() {
    super.onClose();
  }

  Future listaUsuarios() async {
    lista = List<UserModel>().obs;
    update(['lista_usuarios'], lista.isEmpty);
    try {
      lista = await _conexionUsuarios.getAllUsuarios();
      num total = lista.length;
      update(['lista_usuarios'], lista.isNotEmpty);
      Get.snackbar('usuarios', ' usuarios cargados $total',
          icon: Icon(Icons.person),
          barBlur: 2,
          duration: Duration(milliseconds: 800));
    } catch (err) {
      print(err.toString());
      Get.snackbar('Error ', err);
    }
  }

  changeUser(String label) => (String value) {
        print('label $label, value $value');
        switch (label) {
          case 'name':
            selectUser.name = value;
            break;
          case 'avatar':
            selectUser.avatar = value;
            break;
          case 'contact':
            selectUser.contact = value;
            break;
          case 'emailid':
            selectUser.emailid = value;
            break;
          case 'type':
            selectUser.type = value;
            break;
        }
        update(['form_user']);
      };

  newUser() {
    selectUser = UserModel('', '', '', '', '', '');
    print(selectUser);
    update();
  }

  Future selectedUser(UserModel select) async {
    selectUser = select;
    var res = await _conexionUsuarios.idUsuario(select.id);
    selectUser = res;
    update();
  }

  changeStatus(bool state) {
    print('change edit');
    statusEdit = state;
    update();
  }

  Future<bool> saveUser() async {
    try {
      var res = await _conexionUsuarios.createUsuario(selectUser);
      Get.snackbar(
        'Guardado',
        res.message,
      );

      print(res.status);
      if (res.status) {
        await Future.delayed(Duration(seconds: 1));
        Get.back(closeOverlays: true);
        await listaUsuarios();
        update();
      }

      return res.status;
    } catch (err) {
      Get.snackbar(
        'Error',
        '$err.',
      );
      return false;
    }
  }

  Future saveEdit() async {
    var res = await _conexionUsuarios.saveEditUser(selectUser);
    Get.snackbar('Guardado', res.message);
    if (res.status) {
      await Future.delayed(Duration(seconds: 1));
      Get.back(closeOverlays: true);
      listaUsuarios();
      newUser();
    }
  }

  Future deleteUserId() async {
    var res = await _conexionUsuarios.deleteUserId(selectUser.id);
    Get.snackbar('Usuario Eliminado', res.message);
    if (res.status) {
      await Future.delayed(Duration(seconds: 1));
      Get.back(closeOverlays: true);
      listaUsuarios();
      newUser();
    }
  }
}
