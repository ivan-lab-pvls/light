import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mahjong/main.dart';
import 'package:mahjong/util/app_routes.dart';
import 'package:mahjong/views/consts/app_text_style/menu_style.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(promo),
          ),
        ),
      ),
    );
  }
}
