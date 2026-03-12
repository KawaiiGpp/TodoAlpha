import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const themeColor = Colors.green;

final shadow = BoxShadow(
  color: Colors.black.withAlpha(12),
  blurRadius: 10,
  offset: Offset(0, 4),
);

final borderRadius = BorderRadius.circular(10.0);

final dateFormat = DateFormat("yyyy/MM/dd HH:mm:ss");