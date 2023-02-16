import 'package:delivery_app/src/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/src/core/ui/styles/app_styles.dart';
import 'package:delivery_app/src/core/ui/styles/colors_app.dart';
import 'package:delivery_app/src/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../core/ui/config/env/env.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColoredBox(
      color: const Color(0xFF140E0E),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.screenWidth,
              child: Image.asset(
                'assets/images/lanche.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.percentHeight(.30),
                ),
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: context.percentHeight(.1),
                ),
                DeliveryButton(
                  width: context.percentWidth(.6),
                  height: 35,
                  label: 'ACESSAR',
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
