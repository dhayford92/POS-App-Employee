import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';

import '../components/buttons.dart';
import '../components/colour.dart';
import '../components/defaultsizes.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({Key? key}) : super(key: key);
  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Container(
            height: 200,
            width: 70,
            child: Center(child: Image.asset('assets/images/product3.png')),
            decoration: BoxDecoration(
              color: AppColours.secondaryColour,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          title: const Text('Product Name'),
          subtitle: const Text('price: 100.00'),
          trailing: CustomeButton(
            title: 'Add Product',
            onClick: () {},
          ),
        ),
      ),
    );
  }
}

class EmptySearchPage extends StatelessWidget {
  const EmptySearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormat.titleHeader('No Searched Items'),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            width: 300,
            child: Lottie.asset('assets/jsons/empty1.json'),
          )
        ],
      ),
    );
  }
}
