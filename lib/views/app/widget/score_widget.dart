import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/score.png',
            fit: BoxFit.contain,
          ),
          Text(
            score.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
