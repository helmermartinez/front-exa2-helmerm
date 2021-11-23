import 'package:flutter/material.dart';
import 'package:front_exa2_helmerm/charge_page.dart';
import 'package:front_exa2_helmerm/models/titulares.dart';
import 'package:front_exa2_helmerm/services/titulos_services.dart';
import 'package:front_exa2_helmerm/widgets/titulo_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titulosService = Provider.of<TitulosServices>(context);

    if (titulosService.isLoading) return ChargePage();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/library.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Library',
              style: GoogleFonts.parisienne(
                  textStyle: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: titulosService.titular.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              titulosService.selectedTitular =
                  titulosService.titular[index].copy();
              Navigator.pushNamed(context, 'titulos');
            },
            child: TituloCard(
              titular: titulosService.titular[index],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 87, 51, 1),
        child: Icon(Icons.add),
        onPressed: () {
          titulosService.selectedTitular =
              new Titular(idtitulares: '', titulo: '', descripcion: '');
          Navigator.pushNamed(context, 'titulos');
        },
      ),
    );
  }
}
