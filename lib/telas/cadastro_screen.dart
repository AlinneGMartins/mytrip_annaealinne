import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/app_styles.dart';
import 'personalizar_perfil_screen.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  bool mostrarSenha = false;
  bool aceitouTermos = false;
  String generoSelecionado = '';

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
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Criar Conta',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 3),

              const Text(
                'Vamos começar essa jornada\njuntos!',
                style: TextStyle(
                  fontSize: 18,
                  color: AppStyles.verdePrincipal,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 32),

              _CampoCadastro(
                icone: Icons.person_outline,
                hint: 'Nome',
              ),

              const SizedBox(height: 11),

              _CampoCadastro(
                icone: Icons.email_outlined,
                hint: 'E-mail',
                tipo: TextInputType.emailAddress,
              ),

              const SizedBox(height: 11),

              _CampoCadastro(
                icone: Icons.lock_outline,
                hint: 'Senha',
                senha: true,
                mostrarSenha: mostrarSenha,
                aoMostrarSenha: () {
                  setState(() {
                    mostrarSenha = !mostrarSenha;
                  });
                },
              ),

              const SizedBox(height: 11),

              _CampoCadastro(
                icone: Icons.calendar_today_outlined,
                hint: 'Data de nascimento',
                tipo: TextInputType.number,
                formatadores: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataNascimentoFormatter(),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Selecione seu gênero',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppStyles.verdePrincipal,
                ),
              ),

              const SizedBox(height: 13),

              Row(
                children: [
                  Expanded(
                    child: _BotaoGenero(
                      texto: 'Feminino',
                      selecionado: generoSelecionado == 'Feminino',
                      aoSelecionar: () {
                        setState(() {
                          generoSelecionado = 'Feminino';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _BotaoGenero(
                      texto: 'Masculino',
                      selecionado: generoSelecionado == 'Masculino',
                      aoSelecionar: () {
                        setState(() {
                          generoSelecionado = 'Masculino';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _BotaoGenero(
                      texto: 'Prefiro não informar',
                      selecionado:
                      generoSelecionado == 'Prefiro não informar',
                      aoSelecionar: () {
                        setState(() {
                          generoSelecionado = 'Prefiro não informar';
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              GestureDetector(
                onTap: () {
                  setState(() {
                    aceitouTermos = !aceitouTermos;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: aceitouTermos,
                      onChanged: (valor) {
                        setState(() {
                          aceitouTermos = valor ?? false;
                        });
                      },
                      activeColor: AppStyles.verdePrincipal,
                      checkColor: AppStyles.branco,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 11),
                        child: Text(
                          'Eu concordo com os Termos de Uso e Privacidade',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppStyles.verdePrincipal,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    if (!aceitouTermos) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Aceite os Termos de Uso e Privacidade para continuar.',
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const PersonalizarPerfilScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.verdePrincipal,
                    foregroundColor: AppStyles.branco,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Criar conta  →',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 17),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppStyles.verdeClaro,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Ou',
                      style: TextStyle(
                        color: AppStyles.verdePrincipal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppStyles.verdeClaro,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Text(
                    'G',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                  label: const Text(
                    'Continuar com o Google',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppStyles.verdePrincipal,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppStyles.verdePrincipal,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Já tenho uma conta',
                    style: TextStyle(
                      color: AppStyles.verdePrincipal,
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

class _CampoCadastro extends StatelessWidget {
  final IconData icone;
  final String hint;
  final bool senha;
  final bool mostrarSenha;
  final VoidCallback? aoMostrarSenha;
  final TextInputType? tipo;
  final List<TextInputFormatter>? formatadores;

  const _CampoCadastro({
    required this.icone,
    required this.hint,
    this.senha = false,
    this.mostrarSenha = false,
    this.aoMostrarSenha,
    this.tipo,
    this.formatadores,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: senha && !mostrarSenha,
      keyboardType: tipo,
      inputFormatters: formatadores,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppStyles.verdePrincipal,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          icone,
          color: AppStyles.verdePrincipal,
        ),
        suffixIcon: senha
            ? IconButton(
          onPressed: aoMostrarSenha,
          icon: Icon(
            mostrarSenha
                ? Icons.visibility
                : Icons.visibility_outlined,
            color: AppStyles.verdePrincipal,
          ),
        )
            : null,
        filled: true,
        fillColor: AppStyles.branco,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppStyles.azul,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppStyles.verdePrincipal,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class _BotaoGenero extends StatelessWidget {
  final String texto;
  final bool selecionado;
  final VoidCallback aoSelecionar;

  const _BotaoGenero({
    required this.texto,
    required this.selecionado,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        onPressed: aoSelecionar,
        style: OutlinedButton.styleFrom(
          backgroundColor: selecionado
              ? AppStyles.verdeClaro
              : AppStyles.branco,
          side: BorderSide(
            color: selecionado
                ? AppStyles.verdeClaro
                : AppStyles.azul,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppStyles.verdePrincipal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class DataNascimentoFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String texto = newValue.text.replaceAll('/', '');

    if (texto.length > 8) {
      texto = texto.substring(0, 8);
    }

    String resultado = '';

    for (int i = 0; i < texto.length; i++) {
      if (i == 2 || i == 4) {
        resultado += '/';
      }

      resultado += texto[i];
    }

    return TextEditingValue(
      text: resultado,
      selection: TextSelection.collapsed(
        offset: resultado.length,
      ),
    );
  }
}