import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_alpha/todo_alpha_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupNavigationBar();
  runApp(const TodoAlphaApp());
}

void _setupNavigationBar() {
  if (defaultTargetPlatform != TargetPlatform.android || kIsWeb) return;

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
