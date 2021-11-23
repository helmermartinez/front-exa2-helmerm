import 'package:flutter/material.dart';
import 'package:front_exa2_helmerm/models/titulares.dart';

class TitulosFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Titular titular;

  TitulosFormProvider(this.titular);

  bool isValidForm() {
    // print(titular.titulo);
    // print(titular.descripcion);

    return formKey.currentState?.validate() ?? false;
  }
}
