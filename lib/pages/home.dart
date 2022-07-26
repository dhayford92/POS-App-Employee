import 'package:fluent_ui/fluent_ui.dart';
import 'package:pos_shop_app/components/colour.dart';

import '../components/defaultsizes.dart';
import '../utils/example_data.dart';
import '../widget/cartsidecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollSecondController = ScrollController();

  int value = 0;

  @override
  void dispose() {
    super.dispose();
    _scrollController.position.copyWith(axisDirection: AxisDirection.left);
    _scrollSecondController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.backgroundColour,
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: defaultPadding),
                            child: TextFormat.titleHeader('Home'),
                          ),
                          const Spacer(),
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
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Scrollbar(
                              controller: _scrollController,
                              isAlwaysShown: false,
                              style: ScrollbarThemeData(
                                  thickness: 5,
                                  scrollbarColor: AppColours.primaryColour),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: 15,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(
                                        right: defaultPadding, bottom: 10),
                                    child: Acrylic(
                                      luminosityAlpha: 100,
                                      blurAmount: 20,
                                      elevation: 7.0,
                                      shadowColor: AppColours.primaryColour,
                                      tint: AppColours.secondaryColour,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(defaultPadding / 2),
                                        child: const Text(
                                          'Category',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Scrollbar(
                              isAlwaysShown: false,
                              controller: _scrollSecondController,
                              style: ScrollbarThemeData(
                                  thickness: 5,
                                  scrollbarPressingColor:
                                      AppColours.secondaryColour,
                                  scrollbarColor: AppColours.primaryColour),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 237,
                                        childAspectRatio: 2 / 2.3,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 10),
                                itemCount: 20,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Acrylic(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 7.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 300,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColours.productImage,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          defaultPadding / 2)),
                                              child: Image.asset(images[index]),
                                            ),
                                          ),
                                          const ListTile(
                                            title: Text(
                                              'Product Name',
                                              maxLines: 2,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              'Price: Ghc 0.00',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Button(
                                              child: const Text('Sell'),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return ContentDialog(
                                                    title: const Text(
                                                        'Product Name'),
                                                    content: SizedBox(
                                                      height: 150,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            TextFormat
                                                                .productHeader(
                                                                    'Sizes'),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5,
                                                                      bottom:
                                                                          5),
                                                              height: 50,
                                                              child: ListView
                                                                  .builder(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount: sizes
                                                                    .length,
                                                                itemBuilder: (context,
                                                                        index) =>
                                                                    sizedSelector(
                                                                        sizes[
                                                                            index],
                                                                        index),
                                                              ),
                                                            ),
                                                            TextFormat
                                                                .productHeader(
                                                                    'Quantity'),
                                                            //quantity
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                //button 1
                                                                Button(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.all(
                                                                        defaultPadding /
                                                                            2),
                                                                    child: TextFormat
                                                                        .subproductHeader(
                                                                            '-'),
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                                //quantity amount
                                                                TextFormat
                                                                    .subproductHeader(
                                                                        '1'),
                                                                //button 2
                                                                Button(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.all(
                                                                        defaultPadding /
                                                                            2),
                                                                    child: TextFormat
                                                                        .subproductHeader(
                                                                            '+'),
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ],
                                                            ),
                                                          ]),
                                                    ),
                                                    actions: [
                                                      Button(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              ButtonState.all<
                                                                      Color>(
                                                                  Colors.blue),
                                                          elevation: ButtonState
                                                              .all<double>(5.0),
                                                          shadowColor:
                                                              ButtonState.all<
                                                                      Color>(
                                                                  Colors.blue),
                                                        ),
                                                        child: const Text(
                                                            'Add To Cart'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      Button(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              ButtonState.all<
                                                                      Color>(
                                                                  Colors.red),
                                                          elevation: ButtonState
                                                              .all<double>(5.0),
                                                          shadowColor:
                                                              ButtonState.all<
                                                                      Color>(
                                                                  Colors.red),
                                                        ),
                                                        child: const Text(
                                                            'Cancel'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: CartSideCard(),
            ),
          ],
        ),
      ),
    );
  }

  //size selector
  sizedSelector(String title, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 10),
          child: Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: TextFormat.subproductHeader(title),
          ),
          decoration: BoxDecoration(
            color:
                index == value ? AppColours.primaryColour : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColours.primaryColour),
          ),
        ),
      ),
    );
  }
}
