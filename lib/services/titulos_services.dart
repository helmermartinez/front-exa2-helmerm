import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_exa2_helmerm/models/api_response.dart';
import 'package:front_exa2_helmerm/models/titulares.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TitulosServices extends ChangeNotifier {
  final String urlBase = 'back-exa2-helmerm.herokuapp.com';

  final List<Titular> titular = [];
  late Titular selectedTitular;

  bool isLoading = true;
  bool isSaving = false;

  TitulosServices() {
    this.loadTitulos();
  }
  //Listar Titulos
  Future<List<Titular>> loadTitulos() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(urlBase, '/api/titulares/');
    final resp = await http.get(url);

    final List titularList = json.decode(resp.body);

    final Map<int, dynamic> titularMap = titularList.asMap();

    titularMap.forEach((key, value) {
      final tempTitulo = Titular.fromMap(value);
      tempTitulo.id = key;
      this.titular.add(tempTitulo);
    });

    this.isLoading = false;
    notifyListeners();

    return this.titular;
  }

//Guardar Titulos
  Future saveOrCreateTitulos(Titular titular) async {
    isSaving = true;
    notifyListeners();

    if (titular.id == null) {
      await this.createTitulos(titular);
    } else {
      await this.updateTitulos(titular);
    }

    isSaving = false;
    notifyListeners();
  }

  //Editar Titulos
  Future<String> updateTitulos(Titular titular) async {
    final url =
        Uri.https(urlBase, '/api/titulares/update/${titular.idtitulares}');
    final resp = await http.put(url,
        body: titular.toJson(), headers: {"Content-Type": "application/json"});
    final decodedData = resp.body;

    final index = this
        .titular
        .indexWhere((element) => element.idtitulares == titular.idtitulares);

    this.titular[index] = titular;
    this.showToatUpdate();

    return titular.idtitulares!;
  }

  //Eliminar Titulos
  Future deleteTitulo(Titular titulars) async {
    final url =
        Uri.https(urlBase, '/api/titulares/delete/${titulars.idtitulares}');
    final resp = await http.delete(url);
    final decodedData = resp.body;

    final index =
        this.titular.indexWhere((element) => element.id == titulars.id);

    this.titular[index] = titulars;
    this.showToatDelete();

    return titulars.id;
  }

  //Crear Titulo
  Future<String> createTitulos(Titular titular) async {
    final url = Uri.https(urlBase, '/api/titulares/create');
    final resp = await http.post(url,
        body: titular.toJson(), headers: {"Content-Type": "application/json"});
    final decodedData = resp.body;

    this.showToatCreate();

    return titular.idtitulares!;
  }

  void showToatUpdate() => Fluttertoast.showToast(
      msg: "Book has been updated successfully",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black38,
      textColor: Colors.white);

  void showToatCreate() => Fluttertoast.showToast(
      msg: "Book has been created successfully",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black38,
      textColor: Colors.white);

  void showToatDelete() => Fluttertoast.showToast(
      msg: "Book has been deleted successfully",
      fontSize: 18,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black38,
      textColor: Colors.white);
}
