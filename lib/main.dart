import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_grid/src/core/app_bloc_observer.dart';
import 'package:infinite_grid/src/core/app_routes.dart';
import 'package:infinite_grid/src/core/app_themes.dart';
import 'package:infinite_grid/src/core/injection_container.dart' as di;

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    await di.init();
    runApp(const MyApp());
  }, (e, s) async {
    log(e.toString());
    log(s.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        title: 'Infinite grid',
        theme: AppThemes.lightTheme,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: child ?? const SizedBox.shrink(),
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
