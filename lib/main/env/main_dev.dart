import 'package:flutter/material.dart';

import '../init.dart';
import 'env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.dev,
    values: FlavorValues(baseUrl: 'https://demo_dev/web_api.json'),
  );
  init();
}
