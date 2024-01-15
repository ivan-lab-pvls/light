import 'package:flutter/material.dart';
import 'package:mahjong/views/app/widget/action_button.dart';
import 'package:mahjong/views/consts/app_text_style/menu_style.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -size.height * 0.15,
            left: -size.width * 0.25,
            child: Image.asset(
              'assets/images/bison.png',
              height: size.height * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            right: -size.width * 0.2,
            child: Image.asset(
              'assets/images/buddha.png',
              height: size.height * 0.8,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.9,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/papyrus.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.width * 0.14,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'LEVEL DONE',
                          style: ResultTextStyle.resultTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        const Text('Congratulations on \npassing the level',
                            style: ResultTextStyle.resultCongrats),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Text(
                          'SCORE: $score',
                          style: ResultTextStyle.resultScore,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.15,
                            vertical: size.height * 0.01,
                          ),
                          child: Row(
                            children: [
                              ActionButton(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.settingsScreen,
                                  );
                                },
                                assetName: 'assets/images/settings_icon.png',
                                buttonWidth: size.width * 0.05,
                                buttonHeight: size.height * 0.3,
                              ),
                              ActionButton(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.progress,
                                  );
                                },
                                assetName: 'assets/images/next.png',
                                buttonWidth: size.width * 0.2,
                                buttonHeight: size.height * 0.3,
                              ),
                              ActionButton(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.lvl1,
                                  );
                                },
                                assetName: 'assets/images/replay.png',
                                buttonWidth: size.width * 0.05,
                                buttonHeight: size.height * 0.3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
