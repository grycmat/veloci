import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:veloci/routing/app_router.dart';
import 'package:veloci/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VelociApp());
}

class VelociApp extends StatelessWidget {
  const VelociApp({super.key});

  Future<void> _precacheImages(BuildContext context) async {
    await precacheImage(const AssetImage('assets/icon/app_icon.png'), context);
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final lightAppTheme = AppTheme.lightTheme();
    final darkAppTheme = AppTheme.darkTheme();
    return FutureBuilder(
      future: _precacheImages(context),
      builder: (context, asyncSnapshot) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ThemeData lightTheme = lightDynamic != null
                ? lightAppTheme.copyWith(colorScheme: lightDynamic)
                : lightAppTheme;
            ThemeData darkTheme = darkDynamic != null
                ? lightAppTheme.copyWith(colorScheme: darkDynamic)
                : darkAppTheme;

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Veloci Poker Session',
              theme: lightTheme,
              darkTheme: darkTheme,
              routerConfig: AppRouter.router,
            );
          },
        );
      },
    );
  }
}
