import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/core/ui/config/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const App());
}
