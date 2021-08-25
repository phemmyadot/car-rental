import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:flutter/widgets.dart';

class DSBackButton extends StatelessWidget {
  const DSBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 44,
        height: 44,
        child: Center(
          child: DSIcons.backIcon,
        ),
      ),
    );
  }
}
