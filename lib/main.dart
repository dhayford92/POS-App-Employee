// ignore_for_file: avoid_types_as_parameter_names

import 'dart:async';
import 'dart:ui' as ui;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_shop_app/pages/login.dart';

import 'pages/mainpage.dart';

//check if desktop
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() {
  runApp(const MyApp());

  if (isDesktop) {
    doWhenWindowReady(() {
      const initialSize = Size(1480, 830);
      final win = appWindow;
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = 'Lula Basics POS';
      win.show();
    });
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        // ignore: non_constant_identifier_names
        builder: (_, ThemeMode currentMode, MyAppState) {
          return FluentApp(
            debugShowCheckedModeBanner: false,
            title: 'Lula Basics POS',
            home: const SplashScreen(),
            themeMode: currentMode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
                focusTheme: FocusThemeData(
              glowFactor:
                  is10footScreen(ui.window.physicalSize.width) ? 2.0 : 0.0,
            )),
            routes: {
              MainPage.id: (context) => const MainPage(),
              LoginPage.id: (context) => const LoginPage(),
            },
          );
        });
  }
}

//splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 9),
      () => Navigator.of(context).pushReplacementNamed(LoginPage.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Center(
          child: SizedBox(
            width: 400,
            height: 300,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
