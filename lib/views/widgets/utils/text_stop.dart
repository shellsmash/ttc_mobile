import 'package:flutter/material.dart';

TextPainter stopNameSpan(String name) {
  TextSpan textSpan = TextSpan(
    text: name,
    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),

  );
  TextPainter textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
  );
  textPainter.layout();
  return textPainter;
}
