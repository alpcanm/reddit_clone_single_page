import 'package:flutter/material.dart';

class PaddingConst {
  static Padding paddingAll8({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
