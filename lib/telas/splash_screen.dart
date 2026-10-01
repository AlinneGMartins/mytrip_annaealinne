import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import 'login_screen.dart';
import 'cadastro_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.15),
                Colors.black.withOpacity(0.65),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 25,
              ),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  Image.asset(
                    'assets/images/logo.jpg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'MyTrip',
                    style: AppStyles.titulo.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 38,
                    ),
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    'Seu mundo.\nSuas histórias.',
                    textAlign: TextAlign.center,
                    style: AppStyles.subtitulo,
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Guarde suas viagens, fotos\ne momentos favoritos em\num só lugar.',
                    textAlign: TextAlign.center,
                    style: AppStyles.descricao,
                  ),

                  const Spacer(flex: 3),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyles.branco,
                        foregroundColor: AppStyles.texto,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Começar',
                        style: AppStyles.botao,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Já tenho uma conta ›',
                      style: TextStyle(
                        color: AppStyles.branco,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}