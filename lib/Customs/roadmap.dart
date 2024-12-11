import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RoadmapWebView extends StatefulWidget {
  final String url;
  final String titler;

  RoadmapWebView({Key? key, required this.url, required this.titler}) : super(key: key);

  @override
  State<RoadmapWebView> createState() => _RoadmapWebViewState();
}

class _RoadmapWebViewState extends State<RoadmapWebView> {
  InAppWebViewController? webViewController;
  
  String get titler => widget.titler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text(titler, style: TextStyle(fontSize: 20,color: Colors.white)),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)), // Use Uri.parse instead of WebUri
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        // Optionally handle other events, like loading state, errors, etc.
        onLoadError: (controller, url, code, message) {
          // Handle load error
          print("Load error: $message");
        },
        onLoadStop: (controller, url) async {
          // Handle load stop if needed
          print("Load stopped for: $url");
        },
      ),
    );
  }
}