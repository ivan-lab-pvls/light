import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    Key? key,
    required this.assetName,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String assetName;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth * 0.13;

    return AnimatedContainer(
      width: buttonSize,
      height: buttonSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            assetName,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
