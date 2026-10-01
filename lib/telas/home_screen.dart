import 'dart:io';

import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class HomeScreen extends StatelessWidget {
  final String nome;
  final File? fotoPerfil;
  final String? avatarPerfil;

  const HomeScreen({
    super.key,
    required this.nome,
    this.fotoPerfil,
    this.avatarPerfil,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'MyTrip',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: AppStyles.verdePrincipal,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: AppStyles.texto,
                          ),
                        ),

                        _FotoPerfil(
                          fotoPerfil: fotoPerfil,
                          avatarPerfil: avatarPerfil,
                          tamanho: 38,
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    Text(
                      'Olá, $nome!',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppStyles.texto,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'O que tal recordar suas próximas\naventuras?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppStyles.branco,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppStyles.verdeClaro,
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(
                            Icons.search,
                            size: 21,
                            color: AppStyles.texto,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Buscar destino...',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/splash.jpg',
                            height: 165,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Container(
                            height: 165,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                          ),

                          const Positioned(
                            left: 16,
                            bottom: 15,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '📍 Rio de Janeiro',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '10 - 15 de julho de 2026',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Positioned(
                            right: 14,
                            top: 14,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        _InfoCard(
                          numero: '5',
                          texto: 'Viagens',
                          icone: Icons.flight_takeoff,
                        ),
                        const SizedBox(width: 10),
                        _InfoCard(
                          numero: '12',
                          texto: 'Destinos',
                          icone: Icons.location_on_outlined,
                        ),
                        const SizedBox(width: 10),
                        _InfoCard(
                          numero: '147',
                          texto: 'Fotos',
                          icone: Icons.photo_library_outlined,
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Minhas viagens',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: AppStyles.texto,
                            ),
                          ),
                        ),

                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Ver todas ›',
                            style: TextStyle(
                              color: AppStyles.verdePrincipal,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    _ViagemCard(
                      imagem: 'assets/images/splash.jpg',
                      destino: 'Buenos Aires',
                      data: 'Janeiro 2026',
                    ),

                    const SizedBox(height: 10),

                    _ViagemCard(
                      imagem: 'assets/images/splash.jpg',
                      destino: 'Montevidéu',
                      data: 'Setembro 2025',
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 72,
              decoration: BoxDecoration(
                color: AppStyles.branco,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomItem(
                    icone: Icons.home,
                    texto: 'Início',
                    selecionado: true,
                  ),

                  _BottomItem(
                    icone: Icons.map_outlined,
                    texto: 'Viagens',
                  ),

                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppStyles.verdePrincipal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),

                  _BottomItem(
                    icone: Icons.favorite_border,
                    texto: 'Favoritos',
                  ),

                  _BottomItem(
                    icone: Icons.person_outline,
                    texto: 'Perfil',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  final File? fotoPerfil;
  final String? avatarPerfil;
  final double tamanho;

  const _FotoPerfil({
    required this.fotoPerfil,
    required this.avatarPerfil,
    required this.tamanho,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppStyles.verdeClaro,
      ),
      child: ClipOval(
        child: fotoPerfil != null
            ? Image.file(
          fotoPerfil!,
          fit: BoxFit.cover,
        )
            : avatarPerfil != null
            ? Image.asset(
          avatarPerfil!,
          fit: BoxFit.cover,
        )
            : const Icon(
          Icons.person,
          color: AppStyles.verdePrincipal,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String numero;
  final String texto;
  final IconData icone;

  const _InfoCard({
    required this.numero,
    required this.texto,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 82,
        decoration: BoxDecoration(
          color: AppStyles.branco,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              size: 20,
              color: AppStyles.verdePrincipal,
            ),

            const SizedBox(height: 5),

            Text(
              numero,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppStyles.texto,
              ),
            ),

            Text(
              texto,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViagemCard extends StatelessWidget {
  final String imagem;
  final String destino;
  final String data;

  const _ViagemCard({
    required this.imagem,
    required this.destino,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyles.branco,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagem,
              width: 65,
              height: 62,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destino,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppStyles.texto,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.favorite_border,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icone;
  final String texto;
  final bool selecionado;

  const _BottomItem({
    required this.icone,
    required this.texto,
    this.selecionado = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 21,
          color: selecionado
              ? AppStyles.verdePrincipal
              : Colors.grey,
        ),

        const SizedBox(height: 3),

        Text(
          texto,
          style: TextStyle(
            fontSize: 10,
            color: selecionado
                ? AppStyles.verdePrincipal
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}