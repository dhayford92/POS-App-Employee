import 'package:fluent_ui/fluent_ui.dart';
import 'package:pos_shop_app/pages/login.dart';

import '../components/buttons.dart';
import '../components/colour.dart';
import '../components/defaultsizes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.backgroundColour,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            children: [TextFormat.titleHeader('Settings'), const Spacer()],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(height: defaultPadding),
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 70,
                            child: SettingsButton(
                                title: 'Print Invoice', onClick: () {}),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 70,
                            child: SettingsButton(
                                title: 'Refresh Items', onClick: () {}),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            height: 70,
                            child: SettingsButton(
                                title: 'Backup Orders', onClick: () {}),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding * 2),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 50,
                        child: CustomeButton(
                            title: 'Log out',
                            onClick: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginPage.id);
                            }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(210, 218, 218, 218)),
                  ),
                ),
                //user profile
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        child: Icon(FluentIcons.add_medium),
                      ),
                      SizedBox(height: defaultPadding),
                      TextBox(
                        header: 'Full name',
                        padding: EdgeInsets.all(defaultPadding),
                        placeholder: 'Denzel Hayford',
                      ),
                      SizedBox(height: defaultPadding),
                      TextBox(
                        header: 'Username',
                        padding: EdgeInsets.all(defaultPadding),
                        placeholder: 'denhay23',
                      ),
                      SizedBox(height: defaultPadding),
                      TextBox(
                        header: 'Phone Number',
                        padding: EdgeInsets.all(defaultPadding),
                        placeholder: '+233 24 020 9723',
                      ),
                      SizedBox(height: defaultPadding),
                      TextBox(
                        header: 'Email Account',
                        padding: EdgeInsets.all(defaultPadding),
                        placeholder: 'denzel@gmail.com',
                      ),
                      SizedBox(height: defaultPadding),
                      isLoading
                          ? const LoadingButton()
                          : SizedBox(
                              height: 50,
                              child: CustomeButton(
                                  title: 'Update Account',
                                  onClick: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  }),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
