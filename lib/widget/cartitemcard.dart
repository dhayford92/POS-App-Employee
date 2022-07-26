import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_shop_app/components/colour.dart';
import 'package:pos_shop_app/components/defaultsizes.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Container(
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            color: AppColours.backgroundColour,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: SizedBox(
            height: 100,
            width: 70,
            child: Image.asset('assets/images/product4.png'),
          ),
          title: const Text('Product Name'),
          subtitle: const Text('qty: 1 | size : s | subtotal: 0.00'),
          trailing: SizedBox(
            height: 100,
            width: 50,
            child: Button(
              child: TextFormat.subproductHeader('X'),
              style: ButtonStyle(
                backgroundColor: ButtonState.all<Color>(Colors.red.lightest),
                elevation: ButtonState.all<double>(5.0),
                shadowColor: ButtonState.all<Color>(Colors.red.lightest),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

//Order Cart Item
class OrderCartItemsCard extends StatefulWidget {
  const OrderCartItemsCard({Key? key}) : super(key: key);

  @override
  State<OrderCartItemsCard> createState() => _OrderCartItemsCardState();
}

class _OrderCartItemsCardState extends State<OrderCartItemsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Container(
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            color: AppColours.backgroundColour,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: SizedBox(
            height: 100,
            width: 70,
            child: Image.asset('assets/images/product4.png'),
          ),
          title: const Text('Product Name'),
          subtitle: const Text('qty: 1 | size : s | subtotal: 0.00'),
        ),
      ),
    );
  }
}

//Empty Refund Order
class EmptyOrderRefundCard extends StatefulWidget {
  const EmptyOrderRefundCard({Key? key}) : super(key: key);

  @override
  State<EmptyOrderRefundCard> createState() => _EmptyOrderRefundCardState();
}

class _EmptyOrderRefundCardState extends State<EmptyOrderRefundCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormat.titleHeader('No Searched Order'),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset('assets/jsons/empty2.json'),
          )
        ],
      ),
    );
  }
}
