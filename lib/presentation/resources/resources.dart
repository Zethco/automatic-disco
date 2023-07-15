import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/spacing.dart';

part 'dim.dart';
part 'images.dart';

extension SpacingOnWidget on Widget {
  Spacing get spacing => Spacing();
}

extension SpacingOnStateWidget on State {
  Spacing get spacing => Spacing();
}
