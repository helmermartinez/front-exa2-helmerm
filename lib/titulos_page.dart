import 'package:flutter/material.dart';
import 'package:front_exa2_helmerm/services/titulos_services.dart';
import 'package:front_exa2_helmerm/titulos_form_providers.dart';
import 'package:front_exa2_helmerm/widgets/titulos_image.dart';
import 'package:provider/provider.dart';

class TitulosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titulosService = Provider.of<TitulosServices>(context);

    return ChangeNotifierProvider(
      create: (_) => TitulosFormProvider(titulosService.selectedTitular),
      child: _TitulosPageBody(titulosService: titulosService),
    );

    //return _TitulosPageBody();
  }
}

class _TitulosPageBody extends StatelessWidget {
  const _TitulosPageBody({
    Key? key,
    required this.titulosService,
  }) : super(key: key);

  final TitulosServices titulosService;

  @override
  Widget build(BuildContext context) {
    final titularForm = Provider.of<TitulosFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                TituloImage(),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.black54,
                      ),
                    )),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      onPressed: () {
                        //borrar
                        titulosService.deleteTitulo(titularForm.titular);
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        size: 40,
                        color: Colors.black54,
                      ),
                    ))
              ],
            ),
            _TitulosForm(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.save_outlined,
        ),
        onPressed: () async {
          //Guardar Producto
          if (!titularForm.isValidForm()) return;

          await titulosService.saveOrCreateTitulos(titularForm.titular);

          Navigator.pushReplacementNamed(context, 'home');
        },
      ),
    );
  }
}

class _TitulosForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titulosForm = Provider.of<TitulosFormProvider>(context);
    final titular = titulosForm.titular;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: Form(
          key: titulosForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autocorrect: false,
                initialValue: titular.titulo,
                onChanged: (value) => titular.titulo = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El titulo es obligatorio';
                  }
                },
                decoration: InputDecoration(labelText: 'Titulo:'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                autocorrect: false,
                initialValue: titular.descripcion,
                onChanged: (value) => titular.descripcion = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'La descripción es obligatorio';
                  }
                },
                decoration: InputDecoration(labelText: 'Descripción:'),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
