import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../styles/app_styles.dart';
import 'home_screen.dart';

class PersonalizarPerfilScreen extends StatefulWidget {
  const PersonalizarPerfilScreen({super.key});

  @override
  State<PersonalizarPerfilScreen> createState() =>
      _PersonalizarPerfilScreenState();
}

class _PersonalizarPerfilScreenState
    extends State<PersonalizarPerfilScreen> {
  final ImagePicker _imagePicker = ImagePicker();

  File? fotoSelecionada;
  String? avatarSelecionado;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  Future<void> tirarFoto() async {
    final XFile? foto = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (foto != null) {
      setState(() {
        fotoSelecionada = File(foto.path);
        avatarSelecionado = null;
      });
    }
  }

  Future<void> escolherGaleria() async {
    final XFile? foto = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (foto != null) {
      setState(() {
        fotoSelecionada = File(foto.path);
        avatarSelecionado = null;
      });
    }
  }

  void selecionarAvatar(String caminho) {
    setState(() {
      avatarSelecionado = caminho;
      fotoSelecionada = null;
    });
  }

  void continuar() {
    String nome = nomeController.text.trim();

    if (nome.isEmpty) {
      nome = 'Usuário';
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          nome: nome,
          fotoPerfil: fotoSelecionada,
          avatarPerfil: avatarSelecionado,
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.fundo,
      appBar: AppBar(
        backgroundColor: AppStyles.fundo,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppStyles.verdePrincipal,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personalize seu perfil',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Deixe seu perfil com a sua cara!',
                style: TextStyle(
                  fontSize: 16,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 28),

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppStyles.branco,
                        border: Border.all(
                          color: AppStyles.verdePrincipal,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: fotoSelecionada != null
                            ? Image.file(
                          fotoSelecionada!,
                          fit: BoxFit.cover,
                        )
                            : avatarSelecionado != null
                            ? Image.asset(
                          avatarSelecionado!,
                          fit: BoxFit.cover,
                        )
                            : const Icon(
                          Icons.person_outline,
                          size: 60,
                          color: AppStyles.verdePrincipal,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Adicione uma foto de perfil',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppStyles.verdePrincipal,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: tirarFoto,
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                          ),
                          label: const Text('Tirar uma foto'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppStyles.verdePrincipal,
                            side: const BorderSide(
                              color: AppStyles.verdePrincipal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        OutlinedButton.icon(
                          onPressed: escolherGaleria,
                          icon: const Icon(
                            Icons.photo_library_outlined,
                            size: 20,
                          ),
                          label: const Text('Galeria'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppStyles.verdePrincipal,
                            side: const BorderSide(
                              color: AppStyles.verdePrincipal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Ou escolha um avatar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  _Avatar(
                    caminho: 'assets/images/avatar_paisagem_1.jpg',
                    selecionado: avatarSelecionado ==
                        'assets/images/avatar_paisagem_1.jpg',
                    aoSelecionar: () {
                      selecionarAvatar(
                        'assets/images/avatar_paisagem_1.jpg',
                      );
                    },
                  ),

                  const SizedBox(width: 10),

                  _Avatar(
                    caminho: 'assets/images/avatar_paisagem_2.jpg',
                    selecionado: avatarSelecionado ==
                        'assets/images/avatar_paisagem_2.jpg',
                    aoSelecionar: () {
                      selecionarAvatar(
                        'assets/images/avatar_paisagem_2.jpg',
                      );
                    },
                  ),

                  const SizedBox(width: 10),

                  _Avatar(
                    caminho: 'assets/images/avatar_paisagem_3.jpg',
                    selecionado: avatarSelecionado ==
                        'assets/images/avatar_paisagem_3.jpg',
                    aoSelecionar: () {
                      selecionarAvatar(
                        'assets/images/avatar_paisagem_3.jpg',
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Nome',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  hintText: 'Como você quer ser chamado?',
                  hintStyle: const TextStyle(
                    color: AppStyles.verdePrincipal,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppStyles.verdePrincipal,
                  ),
                  filled: true,
                  fillColor: AppStyles.branco,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppStyles.azul,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppStyles.azul,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppStyles.verdePrincipal,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Biografia',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: bioController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Conte um pouco sobre você e suas viagens...',
                  hintStyle: const TextStyle(
                    color: AppStyles.verdePrincipal,
                    fontSize: 14,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Icon(
                      Icons.edit_outlined,
                      color: AppStyles.verdePrincipal,
                    ),
                  ),
                  filled: true,
                  fillColor: AppStyles.branco,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppStyles.azul,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppStyles.verdePrincipal,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: continuar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.verdePrincipal,
                    foregroundColor: AppStyles.branco,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Continuar  →',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String caminho;
  final bool selecionado;
  final VoidCallback aoSelecionar;

  const _Avatar({
    required this.caminho,
    required this.selecionado,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: aoSelecionar,
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selecionado
                  ? AppStyles.verdePrincipal
                  : AppStyles.azul,
              width: selecionado ? 3 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              caminho,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}