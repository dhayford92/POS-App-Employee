import 'package:fluent_ui/fluent_ui.dart';
import 'package:pos_shop_app/components/defaultsizes.dart';

import '../components/colour.dart';
import '../utils/example_data.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _scrollController = ScrollController();
  final _scrollSecondController = ScrollController();

  bool _isDetailShow = false;

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
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          //title card
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: defaultPadding),
                  child: TextFormat.titleHeader('All Products'),
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
              //category tap
              SizedBox(
                height: 60,
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: false,
                  style: ScrollbarThemeData(
                      thickness: 5, scrollbarColor: AppColours.primaryColour),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding:
                            EdgeInsets.only(right: defaultPadding, bottom: 10),
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
                            padding: EdgeInsets.all(defaultPadding / 2),
                            child: const Text(
                              'Category',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
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
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 237,
                                    childAspectRatio:
                                        _isDetailShow ? 2 / 2.7 : 2 / 2.4,
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
                                              color: AppColours.productImage,
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
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 9.0, right: 9.0, bottom: 9.0),
                                        child: Text(
                                          'Description here, Description here, Description here',
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Button(
                                          child: const Text('View Product'),
                                          onPressed: () {
                                            setState(() {
                                              _isDetailShow = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      if (_isDetailShow)
                        Expanded(
                          flex: 2,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 30),
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: AppColours.tintColour,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //detail title
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFormat.productHeader('#Item Detail'),
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
                                            _isDetailShow = false;
                                          });
                                        }),
                                  ],
                                ),
                                SizedBox(height: defaultPadding),
                                //image
                                AnimatedContainer(
                                  height: 250,
                                  width: mediaSize(context).width,
                                  duration: const Duration(milliseconds: 30),
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: Colors.purple.lightest,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:
                                      Image.asset('assets/images/product4.png'),
                                ),
                                SizedBox(height: defaultPadding),
                                //title
                                TextFormat.subproductHeader('Product Title'),
                                SizedBox(height: defaultPadding),
                                //type
                                TextFormat.productHeader('Type: Shopping Bag'),
                                SizedBox(height: defaultPadding),
                                //sizes
                                TextFormat.productHeader(
                                    'Sizes: S | M | XL | XXL'),
                                SizedBox(height: defaultPadding),
                                //colors
                                TextFormat.productHeader('Colour: Black'),
                                SizedBox(height: defaultPadding),
                                TextFormat.productHeader('Quantity: 100'),
                                SizedBox(height: defaultPadding),
                                //describe
                                const Text(
                                  'Description here Description here Description here Description here Description here',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
