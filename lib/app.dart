import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project_x/di_dart.dart';
import 'package:project_x/services/routes/app_rout_config.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/auth_state_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt.get<AuthStateProvider>(),
      child: MaterialApp.router(
        routerDelegate: AppRouteConfig.router.routerDelegate,
        routeInformationParser: AppRouteConfig.router.routeInformationParser,
        routeInformationProvider:
            AppRouteConfig.router.routeInformationProvider,
        builder: (context, child) {
          return LoaderOverlay(
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
