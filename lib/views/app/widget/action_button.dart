import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.onTap,
    required this.assetName,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);

  final VoidCallback onTap;
  final String assetName;
  final double buttonWidth;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          debugPrint('ActionButton tapped: $assetName');
          onTap();
        },
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
