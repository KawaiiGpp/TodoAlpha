import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_alpha/page/home_page.dart';
import 'package:to_do_alpha/todo_alpha.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupAndroidNavigationBar();

  runApp(TodoAlpha());
}

void _setupAndroidNavigationBar() {
  if (!Platform.isAndroid) return;

  WidgetsBinding.instance.endOfFrame.then((_) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: .dark,
        systemNavigationBarContrastEnforced: false,
      ),
    );
  });

  SystemChrome.setEnabledSystemUIMode(.edgeToEdge);
}