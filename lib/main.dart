import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:veloci/routing/app_router.dart';
import 'package:veloci/theme/theme.dart';

void main() {
  runApp(const VelociApp());
}

class VelociApp extends StatelessWidget {
  const VelociApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightAppTheme = AppTheme.lightTheme();
    final darkAppTheme = AppTheme.darkTheme();
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ThemeData lightTheme = lightDynamic != null
            ? lightAppTheme.copyWith(colorScheme: lightDynamic)
            : lightAppTheme;
        ThemeData darkTheme = darkDynamic != null
            ? lightAppTheme.copyWith(colorScheme: darkDynamic)
            : darkAppTheme;

        return MaterialApp.router(
          title: 'Veloci Poker Session',
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
