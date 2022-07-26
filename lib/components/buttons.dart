import 'package:fluent_ui/fluent_ui.dart';
import 'package:pos_shop_app/components/colour.dart';
import 'package:pos_shop_app/components/defaultsizes.dart';

class CustomeButton extends StatefulWidget {
  final String title;
  final VoidCallback onClick;
  const CustomeButton({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return Button(
      child: Center(
        child: Text(widget.title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      onPressed: widget.onClick,
      style: ButtonStyle(
        backgroundColor: ButtonState.all<Color>(Colors.red.lightest),
        elevation: ButtonState.all<double>(5.0),
        shadowColor: ButtonState.all<Color>(AppColours.secondaryColour),
      ),
    );
  }
}




class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding/2),
      child: ProgressBar(
        activeColor: AppColours.primaryColour,
        semanticLabel: 'Loading...',
        strokeWidth: 5.5,
      ));
  }
}



class SettingsButton extends StatefulWidget {
  final String title;
  final VoidCallback onClick;
  const SettingsButton({ Key? key, required this.title, required this.onClick }) : super(key: key);

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Button(
      child: Center(
        child: Text(widget.title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      onPressed: widget.onClick,
      style: ButtonStyle(
        backgroundColor: ButtonState.all<Color>(AppColours.primaryColour),
        elevation: ButtonState.all<double>(5.0),
        shadowColor: ButtonState.all<Color>(AppColours.primaryColour),
      ),
    );
  }
}