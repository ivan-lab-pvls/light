import 'package:flutter/material.dart';
import 'package:mahjong/views/app/widget/score_widget.dart';

import '../../../util/app_routes.dart';
import '../../app/widget/action_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State createState() => _MenuScreenState();
}

class _MenuScreenState extends State {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        )),
        child: Stack(children: [
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.025,
            child: const Row(
              children: [
                ScoreWidget(),
              ],
            ),
          ),
          Positioned(
            bottom: -size.height * 0.08,
            left: -size.width * 0.18,
            child: Image.asset(
              'assets/images/chest.png',
              width: size.width * 0.6,
              height: size.height * 0.5,
            ),
          ),
          Positioned(
            bottom: -size.height * 0.17,
            right: -size.width * 0.27,
            child: Image.asset(
              'assets/images/bison_half.png',
              width: size.width * 0.9,
              height: size.height * 0.9,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.28,
                ),
                ActionButton(
                  buttonWidth: size.width * 0.45,
                  buttonHeight: size.height * 0.3,
                  assetName: 'assets/images/play.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.progress,
                    );
                  },
                ),
                ActionButton(
                  buttonWidth: size.width * 0.35,
                  buttonHeight: size.height * 0.3,
                  assetName: 'assets/images/settings.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.settingsScreen,
                    );
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
