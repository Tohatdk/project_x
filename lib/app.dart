import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project_x/services/routes/app_rout_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouteConfig.router.routerDelegate,
      routeInformationParser: AppRouteConfig.router.routeInformationParser,
      routeInformationProvider: AppRouteConfig.router.routeInformationProvider,
      builder: (context, child) {
        return LoaderOverlay(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }

}
