import 'package:flutter/material.dart'; 
import 'package:zinggerr/config/app_asset.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
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
        backgroundColor: Colors.transparent,
        body: child,
      )
    ]);
  }
}
