import 'package:flutter/material.dart';

class MahjongCard extends StatelessWidget {
  final String cardName;
  final VoidCallback onTap;
  final bool isSelected;

  const MahjongCard({
    super.key,
    required this.cardName,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    double baseCardWidth = MediaQuery.of(context).size.width * 0.1;
    double baseCardHeight = MediaQuery.of(context).size.width * 0.2;

    double cardWidth = isSelected ? baseCardWidth * 1.1 : baseCardWidth;
    double cardHeight = isSelected ? baseCardHeight * 1.1 : baseCardHeight;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: ClipRect(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: cardWidth,
          height: cardHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            cardName,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
