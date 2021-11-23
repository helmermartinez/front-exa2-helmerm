import 'package:flutter/material.dart';
import 'package:front_exa2_helmerm/models/titulares.dart';

class TituloCard extends StatelessWidget {
  final Titular titular;

  const TituloCard({Key? key, required this.titular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 30),
        width: double.infinity,
        height: 170,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _TituloDescription(titular.descripcion),
            Positioned(
                top: 0, left: 0, right: 0, child: _Titulo(titular.titulo))
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 6), blurRadius: 10)
          ]);
}

class _Titulo extends StatelessWidget {
  final String titulo;

  const _Titulo(this.titulo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        titulo,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
    );
  }
}

class _TituloDescription extends StatelessWidget {
  final String descripcion;

  const _TituloDescription(this.descripcion);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 70,
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            descripcion,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      );
}
