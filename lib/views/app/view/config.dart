import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Texax extends StatelessWidget {
  final String xas;

  const Texax({super.key, required this.xas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(xas)),
      ),
    );
  }
}
