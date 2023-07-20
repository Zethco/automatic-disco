import 'package:flutter/material.dart';

import '../init.dart';
import 'env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.qa,
    values: FlavorValues(baseUrl: 'https://demo_qa/web_api.json'),
  );
  init();
}
