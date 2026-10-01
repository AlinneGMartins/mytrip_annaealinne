import 'package:flutter/material.dart';

class AppStyles {
  static const Color fundo = Color(0xFFF6FAFA);
  static const Color verdePrincipal = Color(0xFF176B67);
  static const Color verdeClaro = Color(0xFFDDEDEA);
  static const Color azul = Color(0xFF3D8FA3);
  static const Color texto = Color(0xFF172525);
  static const Color branco = Color(0xFFFFFFFF);

  static const TextStyle titulo = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    color: branco,
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: branco,
  );

  static const TextStyle descricao = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: branco,
  );

  static const TextStyle botao = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: texto,
  );
}