import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  final Widget child;

  const BackgroundColor({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF318CE7),
      child: child,
    );
  }
}
