import 'package:deeventures/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'controllers/setting_state_controller.dart';

class WebView extends StatefulWidget {
  final String pageTitle;
  final String pageLink;

  const WebView({Key? key, required this.pageLink, required this.pageTitle})
      : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<WebView> with TickerProviderStateMixin {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.pageLink));

    _controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingStateController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.chevron_left_outlined),
            ),
            title: Text(
              widget.pageTitle,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: mainGreen,
                  ),
                )
              : WebViewWidget(
                  controller: _controller,
                ),
        ),
      );
    });
  }
}
