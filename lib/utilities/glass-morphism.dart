import 'dart:ui';

import 'package:flutter/material.dart';

final _borderRadius = BorderRadius.circular(20);

class GlassMorphism extends StatelessWidget {
  final dynamic height;
  final dynamic width;
  final child;
  const GlassMorphism({this.height, this.child, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  borderRadius: _borderRadius,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.1)
                  ])
                ),
              ),
              child,
          ],
        ),
      ),
    );
  }
}