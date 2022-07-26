import 'package:fluent_ui/fluent_ui.dart';

import '../components/buttons.dart';
import '../components/colour.dart';
import '../components/defaultsizes.dart';
import '../widget/cartitemcard.dart';
import '../widget/searchitem.dart';

class RefoundOrder extends StatefulWidget {
  const RefoundOrder({Key? key}) : super(key: key);

  @override
  State<RefoundOrder> createState() => _RefoundOrderState();
}

class _RefoundOrderState extends State<RefoundOrder> {
  final _scrollController = ScrollController();
  final _scrollSearchItem = ScrollController();

  List<String> productItem = [];
  List<String> orderItems = [];

  @override
  void dispose() {
    super.dispose();
    _scrollController;
    _scrollSearchItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.backgroundColour,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(children: [
        //title card
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //title
              TextFormat.titleHeader('Refund Order'),
              //search order
              SizedBox(
                width: 350,
                height: 50,
                child: Expanded(
                  child: TextBox(
                    placeholder: 'search order by id',
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
              //item search
              SizedBox(
                width: 350,
                height: 50,
                child: Expanded(
                  child: TextBox(
                    placeholder: 'search item by name',
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

        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    orderItems.isEmpty
                        ? const Text('')
                        : TextFormat.titleHeader('Order ID#: 12345678'),
                    Expanded(
                      child: orderItems.isEmpty
                          ? const EmptyOrderRefundCard()
                          : Scrollbar(
                              isAlwaysShown: false,
                              controller: _scrollController,
                              style: ScrollbarThemeData(
                                  thickness: 10,
                                  scrollbarPressingColor:
                                      AppColours.secondaryColour,
                                  scrollbarColor: AppColours.primaryColour),
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) =>
                                    const CartItemCard(),
                              ),
                            ),
                    ),
                    Row(
                      children: [
                        padding2(context),
                        Column(children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: CustomeButton(
                              title: 'Update Item',
                              onClick: () {},
                            ),
                          ),
                          SizedBox(height: defaultPadding),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: CustomeButton(
                              title: 'Refund All',
                              onClick: () {},
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: productItem.isEmpty
                    ? const EmptySearchPage()
                    : Column(
                        children: [
                          TextFormat.titleHeader('Searched Items'),
                          Expanded(
                            child: Scrollbar(
                              isAlwaysShown: false,
                              controller: _scrollSearchItem,
                              style: ScrollbarThemeData(
                                  thickness: 10,
                                  scrollbarPressingColor:
                                      AppColours.secondaryColour,
                                  scrollbarColor: AppColours.primaryColour),
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) =>
                                    const SearchItem(),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  //summary total
  padding2(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: defaultPadding, top: 10, right: defaultPadding),
        child: Container(
          height: 140,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.purple.lighter,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: const [
              ListTile(
                leading: Text('Amount Taken',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                trailing: Text(
                  '0.00',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
                leading: Text('Change',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                trailing: Text(
                  '0.00',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
                leading: Text('Total',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
                trailing: Text(
                  '0.00',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      );
}
