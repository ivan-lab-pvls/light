import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../util/app_routes.dart';
import '../../app/view/my_in_app_web_view.dart';
import '../../app/widget/navigation_button.dart';

import '../../consts/app_text_style/settings_style.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bison_half.png',
              height: size.height * 0.8,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: -size.width * 0.09,
            child: Image.asset(
              'assets/images/buddha.png',
              height: size.height * 0.7,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: size.width * 0.05,
            left: size.width * 0.025,
            child: NavigationButton(
              assetName: 'assets/images/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonWidth: size.width * 0.07,
            ),
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.9,
                  width: size.width * 0.7,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/papyrus.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Color(0xFFEC9851), Colors.indigo],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'PRIVACY POLICY',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ShowText(
                                  url: 'https://docs.google.com/document/d/1SbDkSviefjVIUpxEHhfs9vmaKisRgrzfgMnFhd5I8BM/edit?usp=sharing'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Color(0xFFEC9851), Colors.indigo],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'TERMS OF USE',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ShowText(
                                  url: 'https://docs.google.com/document/d/1z3fpkq0OlGMtHWub_-gEjy0Acg_r5Mh3DljnfJGMEvE/edit?usp=sharing'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Color(0xFFEC9851), Colors.indigo],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'RATE APP',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                         InAppReview.instance.openStoreListing(appStoreId: '6475712324');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
