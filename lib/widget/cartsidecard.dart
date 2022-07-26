import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';

import '../components/colour.dart';
import '../components/defaultsizes.dart';
import 'cartitemcard.dart';

class CartSideCard extends StatefulWidget {
  const CartSideCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CartSideCard> createState() => _CartSideCardState();
}

class _CartSideCardState extends State<CartSideCard> {
  bool isAdded = true;

  final _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.tintColour,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: defaultPadding, top: 10, right: defaultPadding / 3),
            child: TextFormat.titleHeader('CartItem'),
          ),
          //list of cart
          Expanded(
            child: isAdded
                ? Scrollbar(
                    isAlwaysShown: false,
                    controller: _scrollController,
                    style: ScrollbarThemeData(
                        thickness: 6,
                        scrollbarPressingColor: AppColours.secondaryColour,
                        scrollbarColor: AppColours.primaryColour),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => const CartItemCard(),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Lottie.asset('assets/jsons/empty-cart.json'),
                      ),
                      SizedBox(height: defaultPadding / 5),
                      const Text(
                        'No Items Added',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
          ),

          Container(
            padding: EdgeInsets.only(
                left: defaultPadding, top: 5, right: defaultPadding / 3),
            height: 60,
            child: const Expanded(
              child: TextBox(
                header: 'Amount',
                placeholder: 'Ghc 0.00',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: defaultPadding, top: 10, right: defaultPadding),
            child: Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.purple.lighter,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Text('Change',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      trailing: Text(
                        '0.00',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      leading: Text('Total',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w700)),
                      trailing: Text(
                        '0.00',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )),
          ),
          //button
          Padding(
            padding: EdgeInsets.only(
                left: defaultPadding, top: 10, right: defaultPadding / 3),
            child: Button(
              style: ButtonStyle(
                backgroundColor:
                    ButtonState.all<Color>(AppColours.primaryColour),
                elevation: ButtonState.all<double>(5.0),
                shadowColor: ButtonState.all<Color>(AppColours.secondaryColour),
              ),
              child: const Text(
                'Serve Customer',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('MainPage.id'),
            ),
          ),
          SizedBox(height: defaultPadding * 3)
        ],
      ),
    );
  }
}
