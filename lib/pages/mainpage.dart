import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:pos_shop_app/pages/home.dart';
import 'package:pos_shop_app/pages/order.dart';
import 'package:pos_shop_app/pages/product.dart';
import 'package:pos_shop_app/pages/refund.dart';
import 'package:pos_shop_app/pages/report.dart';
import 'package:pos_shop_app/pages/settings.dart';

import '../components/defaultsizes.dart';
import '../utils/windowbuttons.dart';

class MainPage extends StatefulWidget {
  static String id = 'mainpage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool value = false;

  int index = 0;

  final settingsController = ScrollController();

  @override
  void dispose() {
    settingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: () {
          if (kIsWeb) return TextFormat.mainTextStyle('Lula Basics POS');
          return MoveWindow(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormat.mainTextStyle('Lula Basics POS'),
            ),
          );
        }(),
        actions: kIsWeb
            ? null
            : MoveWindow(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [Spacer(), WindowButtons()],
                ),
              ),
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        size: const NavigationPaneSize(
          openMinWidth: 200,
          openMaxWidth: 240,
        ),
        header: Container(
          height: kOneLineTileHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Image.asset('assets/images/smlogo.png'),
              SizedBox(width: defaultPadding),
              const Text('LBPOS')
            ],
          ),
        ),
        //menu items
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('Home'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.product_list),
            title: const Text('All Product'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.activate_orders),
            title: const Text('Orders'),
          ),
          
          PaneItem(
            icon: const Icon(FluentIcons.return_key),
            title: const Text('Refund'),
          ),
          // PaneItem(
          //   icon: const Icon(FluentIcons.report_document),
          //   title: const Text('Report'),
          // ),
        ],
        //footer
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
      content: NavigationBody(index: index, children: const [
        HomePage(),
        ProductPage(),
        OrderPage(),
        RefoundOrder(),
        // ReportPage(),
        SettingsPage()
      ]),
    );
  }
}
