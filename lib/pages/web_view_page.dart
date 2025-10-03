import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codespace_practice/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  const WebViewPage({super.key, required this.title});
  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  String? name;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)!.settings.arguments as Map?;
      if (map is Map) {
        name = map["title"];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title),
        title: Text(name ?? ""),
      ),
      body: SafeArea(
          child: Container(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 200.w,
            height: 50.h,
            child: Text("返回"),
          ),
        ),
      )),
    );
  }
}
