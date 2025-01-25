import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingOnly(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      Padding(padding: EdgeInsets.only(
          left: left, top: top, right: right, bottom: bottom), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(padding: EdgeInsets.symmetric(
          horizontal: horizontal, vertical: vertical), child: this);
}