import 'package:flutter/material.dart'; 
import 'package:zinggerr/config/app_asset.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child, this.appBar,
  });
  final Widget child;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /// Background Image
      Positioned.fill(
        child: Image.asset(
          AppAssets.background, // replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: child,
      )
    ]);
  }
}
