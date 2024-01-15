import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';
import '../../app/widget/navigation_button.dart';
import '../widget/level_button.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int numberOfLevels = 5;
  int selectedLevelIndex = 0;

  void _onStartLevel() {
    switch (selectedLevelIndex) {
      case 0:
        Navigator.of(context).pushNamed(AppRoutes.lvl1);
        score -= 50;

        break;

      case 1:
        Navigator.of(context).pushNamed(AppRoutes.lvl2);
        score -= 50;

        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 250),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;

      default:
        Navigator.of(context).pushNamed(AppRoutes.lvl1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    LevelButton(
                      assetName: 'assets/images/levels/lvl1.png',
                      isSelected: selectedLevelIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 0;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl2.png',
                      isSelected: selectedLevelIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 1;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl3.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl4.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl5.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl6.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl7.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  children: [
                    LevelButton(
                      assetName: 'assets/images/levels/lvl8.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl9.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl10.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl11.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl12.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl13.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                    LevelButton(
                      assetName: 'assets/images/levels/lvl14.png',
                      isSelected: selectedLevelIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = 2;
                        });
                        _onStartLevel();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.025,
            child: NavigationButton(
              assetName: 'assets/images/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonWidth: screenWidth * 0.06,
            ),
          ),
        ],
      ),
    ));
  }
}
