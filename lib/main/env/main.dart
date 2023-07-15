import 'package:flutter/material.dart';

import '../init.dart';
import 'env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.prod,
    values: FlavorValues(baseUrl: 'https://demo/web_api.json'),
  );
  init();
}
