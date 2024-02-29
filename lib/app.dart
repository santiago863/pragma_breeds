import 'package:flutter/material.dart';
import 'package:pragma_breeds/src/core/theme.dart';

import 'src/core/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Pragma Breeds',
      theme: AppTheme.light,
      routerConfig: appRouter.config(),
    );
  }
}
