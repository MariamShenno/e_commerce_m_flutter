import 'package:e_commerce_m_flutter/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    const App(),
  );
}
 