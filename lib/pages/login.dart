import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';

import '../components/colour.dart';
import '../components/defaultsizes.dart';
import '../main.dart';
import '../utils/windowbuttons.dart';
import 'mainpage.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 30,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Lula Basics POS',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              Expanded(child: MoveWindow()),
              const WindowButtons(),
            ],
          ),
        ),
        Expanded(
          child: SafeArea(
            child: Container(
              color: MyApp.themeNotifier.value == ThemeMode.dark
                  ? const Color(0xFF474747)
                  : AppColours.backgroundColour,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 400,
                    height: 500,
                    child: Lottie.asset('assets/jsons/login.json'),
                  ),
                  const Divider(
                    direction: Axis.vertical,
                    size: 400,
                    style: DividerThemeData(),
                  ),
                  SizedBox(
                    width: 350,
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to Lula basics store!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: defaultPadding / 5),
                        const Text(
                          'Please provide your details to access the system',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ),
                        SizedBox(height: defaultPadding),
                        //login title
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: defaultPadding),
                        //username field
                        TextFormBox(
                            header: 'Username',
                            headerStyle:
                                const TextStyle(fontWeight: FontWeight.w600),
                            cursorColor: Colors.black,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Provide a username';
                              }
                              return null;
                            }),
                        SizedBox(height: defaultPadding / 2),
                        //password field
                        TextFormBox(
                            header: 'Password',
                            headerStyle:
                                const TextStyle(fontWeight: FontWeight.w600),
                            obscureText: !_showPassword,
                            maxLines: 1,
                            suffixMode: OverlayVisibilityMode.always,
                            suffix: IconButton(
                              icon: Icon(
                                !_showPassword
                                    ? FluentIcons.lock
                                    : FluentIcons.unlock,
                              ),
                              onPressed: () => setState(
                                  () => _showPassword = !_showPassword),
                            ),
                            cursorColor: Colors.black,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Provide your password';
                              }
                              return null;
                            }),
                        SizedBox(height: defaultPadding / 2),
                        //button
                        SizedBox(
                          width: 200,
                          child: Button(
                            style: ButtonStyle(
                              backgroundColor: ButtonState.all<Color>(
                                  AppColours.primaryColour),
                              elevation: ButtonState.all<double>(5.0),
                              shadowColor: ButtonState.all<Color>(
                                  AppColours.secondaryColour),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed(MainPage.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
