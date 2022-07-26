import 'package:fluent_ui/fluent_ui.dart';

import '../components/colour.dart';
import '../components/defaultsizes.dart';
import '../widget/cartitemcard.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DateTime date = DateTime.now();
  int _currentIndex = -1;

  bool _isOpen = false;

  final List<String> radioButtons = [
    'All Orders',
    'Refund Orders',
    'Cancelled Orders',
  ];

  final List<String> orderColoumn = [
    'Order ID',
    'Items No',
    'Total (Ghc)',
    'Am-Taken (Ghc)',
    'Change (Ghc)',
    'Status',
    'Date',
    '####',
  ];
  final _scrollController = ScrollController();
  final _scrollOrderController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController;
    _scrollOrderController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.backgroundColour,
      child: Column(
        children: [
          //title card
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //title
                Padding(
                  padding: EdgeInsets.only(left: defaultPadding),
                  child: TextFormat.titleHeader('All Orders'),
                ),
                //date filter
                SizedBox(
                  width: 295,
                  child: DatePicker(
                    selected: date,
                    onChanged: (v) => setState(() => date = v),
                  ),
                ),
                //search
                SizedBox(
                  width: 300,
                  child: Expanded(
                    child: TextBox(
                      placeholder: 'search for item',
                      enableInteractiveSelection: false,
                      outsideSuffix: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Button(
                            child: const Padding(
                              padding: EdgeInsets.all(2),
                              child: Text('Search'),
                            ),
                            onPressed: () {}),
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FluentIcons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //category type
          const SizedBox(height: 6),
          //status
          SizedBox(
            child: Row(
              children: List.generate(radioButtons.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RadioButton(
                    checked: _currentIndex == index,
                    onChanged: (value) => setState(() => _currentIndex = index),
                    content: Text(radioButtons[index]),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: orderColoumn.length,
                          itemBuilder: (context, index) => SizedBox(
                            height: 20,
                            width: 152,
                            child: Center(
                              child: Text(
                                orderColoumn[index],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Scrollbar(
                          isAlwaysShown: false,
                          controller: _scrollOrderController,
                          style: ScrollbarThemeData(
                              thickness: 6,
                              scrollbarPressingColor:
                                  AppColours.secondaryColour,
                              scrollbarColor: AppColours.primaryColour),
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: AppColours.tintColour,
                                    borderRadius: BorderRadius.circular(6)),
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      rowCard('#0933458'),
                                      rowCard('16'),
                                      rowCard('124.00'),
                                      rowCard('200.00'),
                                      rowCard('76.00'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            child: rowCard('Set'),
                                            decoration: BoxDecoration(
                                                color: Colors.green
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(6))),
                                      ),
                                      rowCard('29/06/2022'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: SizedBox(
                                          height: 45,
                                          width: 150,
                                          child: Button(
                                            child: const Center(
                                                child: Text(
                                              'View Order',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                            onPressed: () {
                                              setState(() {
                                                _isOpen = true;
                                              });
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  ButtonState.all<Color>(
                                                      Colors.red.lightest),
                                              elevation:
                                                  ButtonState.all<double>(3.0),
                                              shadowColor:
                                                  ButtonState.all<Color>(
                                                      AppColours.primaryColour),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isOpen)
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(defaultPadding / 2),
                        child: Acrylic(
                          elevation: 5,
                          luminosityAlpha: 100,
                          blurAmount: 10,
                          shadowColor: AppColours.secondaryColour,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultPadding - 6)),
                          child: Column(
                            children: [
                              //detail title
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFormat.productHeader('#ID 1235567'),
                                    Button(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              ButtonState.all<Color>(
                                                  Colors.red.lightest),
                                          elevation:
                                              ButtonState.all<double>(5.0),
                                          shadowColor: ButtonState.all<Color>(
                                              Colors.red.lightest),
                                        ),
                                        child:
                                            TextFormat.productHeader('close'),
                                        onPressed: () {
                                          setState(() {
                                            _isOpen = false;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              //Date
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFormat.productHeader('Date'),
                                    TextFormat.productHeader('29/06/2022'),
                                  ],
                                ),
                              ),
                              //status
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFormat.productHeader('Status'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: 100,
                                          height: 40,
                                          child: Center(
                                            child:
                                                TextFormat.productHeader('Set'),
                                          ),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.green.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                    ),
                                  ],
                                ),
                              ),

                              //list of items
                              Expanded(
                                child: Scrollbar(
                                  isAlwaysShown: false,
                                  controller: _scrollController,
                                  style: ScrollbarThemeData(
                                      thickness: 6,
                                      scrollbarPressingColor:
                                          AppColours.secondaryColour,
                                      scrollbarColor: AppColours.primaryColour),
                                  child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index) =>
                                        const OrderCartItemsCard(),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    left: defaultPadding,
                                    top: 10,
                                    right: defaultPadding),
                                child: Container(
                                    height: 140,
                                    width: mediaSize(context).width,
                                    decoration: BoxDecoration(
                                        color: Colors.purple.lighter,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: const [
                                        ListTile(
                                          leading: Text('Amount Taken',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)),
                                          trailing: Text(
                                            '0.00',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Text('Change',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)),
                                          trailing: Text(
                                            '0.00',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Text('Total',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700)),
                                          trailing: Text(
                                            '0.00',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(height: defaultPadding),
                            ],
                          ),
                        ),
                      ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  rowCard(String title) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Center(
        child: Text(
          title,
          softWrap: true,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
