import 'package:delivery_app/src/core/application_binding/application_bindig.dart';
import 'package:delivery_app/src/core/ui/theme/theme_config.dart';
import 'package:delivery_app/src/pages/home/home_router.dart';
import 'package:delivery_app/src/pages/product_detail/product_detail_router.dart';
import 'package:delivery_app/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        initialRoute: "/",
        routes: {
          '/':(context) => const SplashPage(),
          '/home':(context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
        },
      ),
    );
  }
}