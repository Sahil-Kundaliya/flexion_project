import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  WebScreen({Key? key}) : super(key: key);
  static const routeName = "/web_screen";

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final _key = UniqueKey();
  late final WebViewController _controller;
  late final arguments;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments = (ModalRoute.of(context)?.settings.arguments) as Map;
    _controller = WebViewController()
      ..loadRequest(
        Uri.parse(arguments['url']),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            arguments['title'],
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: WebViewWidget(
              key: _key,
              controller: _controller,
            ))
          ],
        ));
  }
}
