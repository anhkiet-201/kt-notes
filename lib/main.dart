import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktnotes/app/kt_notes_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    const KtNotesApp()
  );
}