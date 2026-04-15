import 'package:flutter/material.dart';
import 'package:fauma_app/router/app_router.dart';
import 'package:fauma_app/theme/fauma_theme.dart';

class FaumaApp extends StatelessWidget {
  const FaumaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fauma',
      debugShowCheckedModeBanner: false,
      theme: FaumaTheme.light,
      routerConfig: appRouter,
    );
  }
}
