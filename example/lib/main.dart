import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
// import 'package:gluestack_ui_example/custom_config.dart';
// import 'package:gluestack_ui_example/providers/theme_provider/theme_provider.dart';
import 'package:gluestack_ui_example/routes/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      // This is how we can provide custom configuration to Gluestack Theme.
      // gluestackCustomConfig: GluestackCustomConfig(
      //   button: customButton,
      //   buttonText: customButtonText,
      // ),
      child: Consumer(
        builder: (context, ref, child) {
          // final currentThemeMode = ref.watch(toggleThemeProvider);
          return GSAppRouter(
            color: $GSColors.primary500,
            routerConfig: router,
            // themeMode: currentThemeMode,
            // theme: ThemeData(
            //     colorSchemeSeed: Colors.deepPurple,
            //     useMaterial3: true,
            //     brightness: Brightness.light,
            //     appBarTheme:
            //         Theme.of(context).appBarTheme.copyWith(elevation: 4.0)),
            // darkTheme: ThemeData(
            //     colorSchemeSeed: Colors.deepPurple,
            //     useMaterial3: true,
            //     brightness: Brightness.dark,
            //     appBarTheme:
            //         Theme.of(context).appBarTheme.copyWith(elevation: 4.0)),
          );
        },
      ),
    );
  }
}
