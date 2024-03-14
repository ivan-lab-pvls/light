import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:mahjong/data/repository/promotion.dart';
import 'package:mahjong/util/app_routes.dart';
import 'package:mahjong/views/app/view/splash.dart';

import 'data/options.dart';
import 'views/consts/app_text_style/menu_style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Config.currentPlatform);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await remoteConfig.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: FutureBuilder<bool>(
        future: Promotions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Colors.purple,
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!) {
            return const PromotionScreen();
          } else {
            return const SplashScreen(
              homeRoute: AppRoutes.home,
            );
          }
        },
      ),
    );
  }

  Future<bool> Promotions() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    final fetch1 = remoteConfig.getString('promotion');
    final fetch2 = remoteConfig.getString('promotionData');
    final client = HttpClient();
    var request = await client.getUrl(Uri.parse(fetch1));
    request.followRedirects = false;
    var response = await request.close();
    if (!fetch1.contains('null')) {
      if (response.headers.value(HttpHeaders.locationHeader).toString() !=
          fetch2) {
        promo = fetch1;
        return true;
      }
      return false;
    }
    return false;
  }
}
